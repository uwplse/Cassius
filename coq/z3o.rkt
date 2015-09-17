#lang racket
(require "macros_extr.rkt")


(define list_eq_dec (lambdas (eq_dec l l~)
  (match l
     ((Nil)
       (match l~
          ((Nil) `(Left))
          ((Cons a l0) `(Right))))
     ((Cons y l0)
       (match l~
          ((Nil) `(Right))
          ((Cons a0 l1)
            (match (@ eq_dec y a0)
               ((Left)
                 (match (@ list_eq_dec eq_dec l0 l1)
                    ((Left) `(Left))
                    ((Right) `(Right))))
               ((Right) `(Right)))))))))
  
(define map (lambdas (f l)
  (match l
     ((Nil) `(Nil))
     ((Cons a t) `(Cons ,(f a) ,(@ map f t))))))
  
(define restEqDec (lambdas (l r) (if (eq? l r) `(Left) `(Right))))

(define exprEqDec (lambdas (l r)
  (match l
     ((If a b c)
       (match r
          ((If a0 b0 c0)
            (match (@ exprEqDec a a0)
               ((Left)
                 (match (@ exprEqDec b b0)
                    ((Left)
                      (match (@ exprEqDec c c0)
                         ((Left) `(Left))
                         ((Right) `(Right))))
                    ((Right) `(Right))))
               ((Right) `(Right))))
          ((And a0 b0) `(Right))
          ((Unknown r0 l0) `(Right))))
     ((And a b)
       (match r
          ((If a0 b0 c) `(Right))
          ((And a0 b0)
            (match (@ exprEqDec a a0)
               ((Left)
                 (match (@ exprEqDec b b0)
                    ((Left) `(Left))
                    ((Right) `(Right))))
               ((Right) `(Right))))
          ((Unknown r0 l0) `(Right))))
     ((Unknown r0 l0)
       (match r
          ((If a b c) `(Right))
          ((And a b) `(Right))
          ((Unknown r1 l1)
            (match (@ restEqDec r0 r1)
               ((Left)
                 (match (@ list_eq_dec exprEqDec l0 l1)
                    ((Left) `(Left))
                    ((Right) `(Right))))
               ((Right) `(Right)))))))))
  
(define ifAndR (lambda (ex)
  (match ex
     ((If a b c) `(If ,a ,b ,c))
     ((And a0 b0)
       (match a0
          ((If a b c)
            (match b0
               ((If d e f)
                 (match (@ exprEqDec a d)
                    ((Left) `(If ,a ,(ifAndR `(And ,b ,e))
                      ,(ifAndR `(And ,c ,f))))
                    ((Right) `(And ,`(If ,a ,b ,c) ,`(If ,d ,e ,f)))))
               ((And a1 b1) `(And ,`(If ,a ,b ,c) ,`(And ,a1 ,b1)))
               ((Unknown r l) `(And ,`(If ,a ,b ,c) ,`(Unknown ,r ,l)))))
          ((And a b) `(And ,`(And ,a ,b) ,b0))
          ((Unknown r l) `(And ,`(Unknown ,r ,l) ,b0))))
     ((Unknown r l) `(Unknown ,r ,l)))))
  
(define ifAnd (lambda (ex)
  (match ex
     ((If a b c) `(If ,(ifAnd a) ,(ifAnd b) ,(ifAnd c)))
     ((And l r) (ifAndR ex))
     ((Unknown r l) `(Unknown ,r ,(@ map ifAnd l))))))
  
