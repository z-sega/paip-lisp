(defun len11 (l*)
  (labels ((len-acc (l0* acc)
	   (if (null l0*)
	       acc
	       (len-acc (rest l0*) (incf acc)))))
    (len-acc l* 0)))

(defun len12 (l* &optional (acc 0))
  (if (null l*)
      acc
      (len12 (rest l*) (incf acc))))

(defun len10 (l*)
  (if (null l*) 
      0
      (+ 1 (len10 (rest l*)))))


(defmacro while2 (test &rest body)
  "Repeat body while test is true."
  (list* 'loop
	 (list 'unless test '(return nil))
	 body))

(defmacro while3 (test &rest body)
  "Repeat body while test is true."
  (let ((code '(loop (unless test (return nil)) . body)))
    (subst test 'test (subst body 'body code))))

(defmacro while4 (test &rest body)
  "Repeat body while test is true."
  `(loop (unless ,test (return nil))
	 ,@body))
