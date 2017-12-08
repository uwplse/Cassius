#lang racket

(require "common.rkt" "tree.rkt" "selectors.rkt")
(provide link-elts-boxes link-matched-elts-boxes)

(define (sheet->display elts sheet)
  (if (ormap (curryr set-member? '?) sheet)
      (λ (elt) (if (equal? (node-type elt) 'head) 'none '?))
      (let ([eqs (equivalence-classes sheet (sequence->list (in-tree elts)))])
        (λ (elt)
          (match-define (cons class-hash value-hash) (dict-ref eqs 'display))
          (if (equal? (node-type elt) 'head)
              'none
              (dict-ref value-hash (dict-ref class-hash elt)))))))

(define (sheet->font elts sheet)
  (if (ormap (curryr set-member? '?) sheet)
      (λ (elt) (if (equal? (node-type elt) 'head) 'none '?))
      (let ([eqs (equivalence-classes sheet (sequence->list (in-tree elts)))])
        (λ (elt)
          (match-define (cons class-hash-family value-hash-family) (dict-ref eqs 'font-family))
          (match-define (cons class-hash-weight value-hash-weight) (dict-ref eqs 'font-weight))
          (match-define (cons class-hash-style value-hash-style) (dict-ref eqs 'font-style))
          (if (equal? (node-type elt) 'head)
              'none
              (list (dict-ref value-hash-family (dict-ref class-hash-family elt))
                    (dict-ref value-hash-weight (dict-ref class-hash-weight elt))
                    (dict-ref value-hash-style (dict-ref class-hash-style elt))))))))

(define (link-matched-elts-boxes sheet elts boxes)
  (define num->elt (make-hasheq))
  (define box->elt (make-hasheq))
  (define first-box (make-hasheq))
  (define last-box (make-hasheq))
  (for ([elt (in-tree elts)] #:when (node-get elt ':num))
    (dict-set! num->elt (node-get elt ':num) elt))
  (for ([box (in-tree boxes)] #:when (node-get box ':elt))
    (define elt (dict-ref num->elt (node-get box ':elt)))
    (dict-set! box->elt box elt)
    (unless (dict-has-key? first-box elt)
      (dict-set! first-box elt box))
    (dict-set! last-box elt box))

  (λ (x)
    (let ([elt (dict-ref box->elt x #f)])
      (and elt
           (list elt
                 (equal? x (dict-ref first-box elt #f))
                 (equal? x (dict-ref last-box elt #f)))))))

;; Old stuff--still somewhat broken

(define (link-elts-boxes sheet elts boxes)
  (define box->elt (make-hasheq))
  (define (match! elt box)
    (eprintf "LINK!!! ~a ~a\n" box elt)
    (dict-set! box->elt box elt))
  (define display (sheet->display elts sheet))
  (link-view match! display elts boxes)
  (for ([x (in-tree boxes)] #:when (set-member? '(BLOCK INLINE MAGIC) (node-type x)))
    (eprintf "~a" x)
    (when (dict-has-key? box->elt x)
      (eprintf " ~~ ~a (~a)" (dict-ref box->elt x) (display (dict-ref box->elt x))))
    (eprintf "\n"))
  (λ (x)
    (let ([elt (dict-ref box->elt x #f)])
      (and elt (list elt #f #f)))))

(define (collect-possible-elements . boxes)
  (reap [sow]
    (for ([head boxes])
      (let loop ([box head])
        (match (node-type box)
          [(or 'MAGIC 'BLOCK 'INLINE) (sow box)]
          [(or 'ANON 'LINE 'VIEW)
           (map loop (node-children box))]
          ['TEXT (void)])))))

(define (elt-displayed-children elt display)
  (filter (λ (x) (or (string? x) (not (equal? (display x) 'none)))) (node-children* elt)))

(define (link-complex-block match! display elt box)
  "Link the inline children of an element, given that they must be linked in box mode"

  (define (reenter es* bs)
    (assert (equal? (node-type (caar bs)) 'ANON) "ANON not found")
    (assert (andmap (λ (x) (equal? (node-type x) 'LINE)) (node-children (caar bs)))
            "ANON block does not contain LINEs")
    (define sublines (append-map node-children (node-children (caar bs))))

    (for/fold ([bs* (cons sublines bs)]) ([e (reverse es*)])
      (assert (equal? (node-type (caar bs*)) 'INLINE) "INLINE not found" e)
      (match! (car e) (caar bs*))
      (cons (node-children (caar bs*)) bs*)))

  (eprintf "\n\n")
  (let loop ([es (list (elt-displayed-children elt display))] [block-mode? #t] [bs (list (node-children box))])
    (eprintf "~s ~ ~s\n" es bs)
    (match es
      [(list (cons e e*) es* ...)
       (eprintf "Entering ~s, display ~a\n" e (if (string? e) 'text (display e)))
       (cond
        [(string? e)
         (define bs* (if block-mode? (reenter es* bs) bs))
         (assert (equal? (node-type (caar bs*)) 'TEXT) "TEXT not found" e)
         (loop (cons e* es*) #f (cons (cdar bs*) (cdr bs*)))]
        [(equal? (display e) 'inline-block)
         (define bs* (if block-mode? (reenter es* bs) bs))
         (assert (equal? (node-type (caar bs*)) 'INLINE) "INLINE not found" e)
         (link-block match! display e (caar bs*))
         (loop (cons e* es*) #f (cons (cdar bs*) (cdr bs*)))]
        [(equal? (display e) 'inline)
         (define bs* (if block-mode? (reenter es* bs) bs))
         (assert (equal? (node-type (caar bs*)) 'INLINE) "INLINE not found" e)
         (match! e (caar bs*))
         (loop (cons (elt-displayed-children e display) es) #f (cons (node-children (caar bs*)) bs*))]
        [(equal? (display e) 'block)
         (define bs*
           (if (equal? (length bs) 1)
               (car bs) ;; 
               (cdr (last bs)))) ;; Need to exit a few blocks, so must delete head of last
         (assert (equal? (node-type (car bs*)) 'BLOCK) "BLOCK not found" e)
         (link-block match! display e (car bs*))
         (loop (cons e* es*) #t (list (cdr bs*)))])]
      [(list '() (cons e e*) es* ...)
       (if block-mode?
           (loop (cons e* es*) block-mode? bs)
           (loop (cons e* es*) block-mode? (cons (cdadr bs) (cddr bs))))]
      [(list '())
       (void)])))

(define (link-inlines match! display elts boxs)
  (define elts* (filter node? elts))
  (define boxs* (apply collect-possible-elements boxs))

  (cond
   [(equal? (length elts*) (length boxs*))
    (for ([elt elts*] [box boxs*])
      ;; TODO: does not recurse
      (match! elt box)
      (if (equal? (display elt) 'inline-block)
          (link-block match! display elt box)
          (link-inlines match! display (elt-displayed-children elt display) (node-children box))))]
   #;[(equal? (length elts*) 1)
    (for-each (curry match! (car elts)) boxs*)
    (link-inlines match! display (car elts*) (append-map node-children boxs*))]
   [else
    (error "Confusing inlines, cannot match" elts boxs)]))

(define (link-view match! display elt box)
  (unless (equal? (node-type box) 'VIEW)
    (error "link-view must be given a VIEW box to link" box))
  (link-block match! display elt (node-fchild box)))

(define (link-block match! display elt box)
  (unless (set-member? '(block inline-block) (display elt))
    (error "link-block must be given a block element to link"))

  (match! elt box)

  (define subelts (elt-displayed-children elt display))
  (define subboxes (node-children box))

  (cond
   [(andmap (λ (x) (and (node? x) (equal? (display x) 'block))) subelts)
    (for-each (curry link-block match! display) (filter node? subelts) subboxes)]
   [(andmap (λ (x) (equal? (node-type x) 'LINE)) subboxes)
    (link-inlines match! display subelts (append-map node-children subboxes))]
   [else
    (link-complex-block match! display elt box)]))
