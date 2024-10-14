;;; Write a function that will print an expression in
;;; dotted pair notation. Use the built-in function
;;; princ to print each component of the expression.

;;; An Expr is one of:
;;; - atom
;;; - (cons Expr Expr*)

;;; Expr -> Expr
(defun to-dp-notation (expr)
  "Attempt to print expr in dotted pair notation."
  (cond
    ((atom expr) (princ expr))
    (t (princ "(")
       (to-dp-notation (first expr))
       (princ " . ")
       (to-dp-notation (rest expr))
       (princ ")"))))

(defun dprint (x)
  "Prints expr in dotted pair notation."
  (cond
    ((atom x) (princ x))
    (t (princ "(")
       (dprint (first x))
       (princ " . ")
       (dprint (rest x))
       (princ ")")
       x)))
