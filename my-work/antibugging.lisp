(defun average (numbers)
  "Compute the average of NUMBERS."
  (if (null numbers)
      (progn (cerror "Use 0 as the average."
		     "Average of the empty list is undefined.")
	     0)
      (/ (reduce  #'+ numbers)
	 (length numbers))))

(defun checked-sqr (x)
  "CE: Multiply x by itself."
  ;; (check-type x number)
  (assert (numberp x) (x))
  (sqr x))

(defun sqr (x)
  "Multiply x by itself."
  (* x x))

