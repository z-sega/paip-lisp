;; write a function that counts the number of atoms in an
;; expression. For example: (count-atoms '(a (b) c)) = 3.
;; Notice that there is something of an ambiguity in this:
;; should (a nil c) count as three atoms, or as two,
;; because it is equivalent to (a () c)?

;; It is easier to count 2

;; An expr is one of:
;; - atom
;; - list-expr

;; expr -> number
(defun count-atoms (exp)
  "Counts number of atoms in exp."
  (if (atom exp)
      1
      (length (remove-if-not #'atom exp))))
