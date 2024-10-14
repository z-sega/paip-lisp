;;; Write a function that, like the regular print function,
;;; will print an expression in dotted pair notation when
;;; necessary but will use normal list notation when
;;; possible.


;;; An Expr is one of:
;;; - atom
;;; - (cons Expr Expr*)

;;; Expr -> Expr
(defun like-print (x)
  "Print expression x like built-in print."
  (labels ((pr-rest (x)
	     "Print rest of list like built-in print."
	     (cond ((null x))		; do nothing
		   ((atom x) (princ " . ") (princ x))
		   (t (princ " ") (like-print (first x)) (pr-rest (rest x))))))
    (cond
      ((atom x) (princ x))
      (t (princ "(")
	 (like-print (first x))
	 (pr-rest (rest x))
	 (princ ")")
	 x))))
