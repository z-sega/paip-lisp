;; write a functio to exponeniate, or raise a number to an integer power.
;; For example: (power 3 2) = 3 * 3 = 9.

;; number integer -> number
(defun power (num n)
  "Raise num to n."
  (cond
    ((= n 0) 1)
    (t (* num (power num (- n 1))))))
