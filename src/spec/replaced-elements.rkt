#lang racket
(require "../tree.rkt")
(provide element-replaced? element-image? element-br?)

(define (element-replaced? elt)
  (set-member? '(img input iframe object textarea br) (slower (node-type elt))))

(define (element-image? elt)
  (equal? 'img (slower (node-type elt))))

(define (element-br? elt)
  (equal? 'br (slower (node-type elt))))

