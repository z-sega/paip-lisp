;; an expr is one of:
;; - atom
;; - list

;; atomprint :: expr -> nil
(defun atomprint (exp &optional (depth 0))
  "Print each atom in exp, along with its depth of nesting."
  (if (atom exp)
      (format t "~&ATOM: ~a, DEPTH ~d" exp depth)
      (dolist (element exp)
	(atomprint element (+ depth 1)))))

;; ex-1.4
;; write a function that counts the number of times an expression
;; occurs anywhere within another expression.
;; Example:
;; (count-anywhere 'a '(a ((a) b) a)) => 3

;; an expr
;; - atom
;; - (listof expr)

;; expr expr -> N
(defun count-anywhere (a b)
  "Count the number of times an expr a occurs in b."
  (labels (;; (listof expr) -> N
	   ;; Counts the number of times a occurs in b*
	   (count-anywhere/list (b*)
	     (cond
	       ((null b*) 0)
	       (t (+ (count-anywhere a (first b*))
		     (count-anywhere/list (rest b*)))))))
    (if (atom b)
	(if (equal a b) 1 0)
	(count-anywhere/list b))))
