#lang racket
(require "../src/common.rkt" "../src/input.rkt" "../src/dom.rkt")

(define (average . nums)
  (/ (apply + nums) (length nums)))

(define (percentile n nums #:round [round round])
  (list-ref (sort nums <) (round (* (length nums) n))))

(define (histogram list buckets)
  (let* ([themin (apply min list)]
         [themax (apply max list)]
         [bucketsz (ceiling (/ (- themax themin) buckets))]
         [hist (make-vector buckets 0)])
    (for-each (lambda (arg)
                (let* ([whichbucket (min (exact-round (/ (- arg themin) bucketsz)) (- buckets 1))]
                       [curval (vector-ref hist whichbucket)])
                (vector-set! hist whichbucket (+ curval 1))))
              list)
    hist))

(define (print-hist hist minval maxval interval)
  (printf "Histogram: \"min\": ~a, \"max\":~a, \"interval\": ~a, \"counts\": [~a]\n"
          minval
          maxval
          interval
          (string-join (map number->string (vector->list hist)) ",")))

(define (summarize type list)
  (let ((themin (apply min list))
        (themax (apply max list)))
    (printf "~a: ~a average, ~a–~a IQR, ~a–~a range\n"
            type
            (exact->inexact (apply average list))
            (percentile 1/4 list #:round floor)
            (percentile 3/4 list #:round ceiling)
            themin
            themax)
    (print-hist (histogram list 10) themin themax (ceiling (/ (- themax themin) 10)))))

(define (stats names)
  (define probs (append-map (compose dict-values (curryr call-with-input-file parse-file)) names))
  (define-values
    (elts boxes rules)
    (for/reap [elts! boxes! rules!] ([prob probs])
      (for-each rules! (map length (dict-ref prob ':sheets)))
      (for ([dom (dict-ref prob ':documents)])
        (define dom* (parse-dom dom))
        (elts! (length (sequence->list (in-elements dom*))))
        (boxes! (length (sequence->list (in-boxes dom*)))))))
  (summarize "Elements" elts)
  (summarize "Boxes" boxes)
  (summarize "Rules" rules))

(module+ main
  (command-line
   #:args names
   (stats names)))
