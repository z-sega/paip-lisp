;;; The function bank-account returns a closure that can
;;; be used as a representation of a bank account. The
;;; closure captures the local variable - balance.
;;; The body of the closure provides code to access and
;;; modify the local variable.

(defun bank-account (balance)
  "Open a bank account starting with the giving balance."
  #'(lambda (action amount)
      (case action
	(deposit (setf balance (+ balance amount)))
	(withdraw (setf balance (- balance amount))))))

(defvar a 'global-a)
(defvar *b* 'global-b)

(defun fn () *b*)

(let ((a 'local-a)
      (*b* 'local-b))
  (list a *b* (fn) (symbol-value 'a) (symbol-value '*b*)))
