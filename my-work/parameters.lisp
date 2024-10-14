(defun math-quiz (op range n)
  "Ask the user a series of math problems."
  (dotimes (i n)
    (problem (random range) op (random range))))

(defun problem (x op y)
  "Ask a math problem, read a reply, and say if it is correct."
  (format t "~&How much is ~d ~a ~d?" x op y)
  (if (eql (read) (funcall op x y))
      (princ "Correct!")
      (princ "Sorry, that's not right.")))
