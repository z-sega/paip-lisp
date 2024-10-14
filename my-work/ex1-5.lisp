;; ex1.5
;; Write a function to compute the dot product of two seequences of
;; numbers, represented as lists. The dot product is computed by
;; multiplying corresponding elements and then adding up the
;; resulting products

;; example: (dot-product '(10 20) '(3 4)) => (+ (* 10 3) (* 20 4)) => 110

;; (listof number) (listof number) -> number
(defun dot-product (a b)
  "
Compute dot product of a & b.
Assuming (equal (length a) (length b))"
  (apply #'+ (mapcar #'* a b)))
