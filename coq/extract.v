Require Export Mini.
Extraction Language Scheme.
Extract Constant Mini.RestEqDec => "(lambdas (l r) (if (eq? l r) `(Left) `(Right)))". 
Extraction "z3o" IfAnd.
