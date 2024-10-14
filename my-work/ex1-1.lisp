;; Define a version of last-name that handles "Rex Morgan MD", "Morton Downey, Jr.",
;; and whatever other cases you can think of.

(defparameter *titles*
  '(Mr Mrs Miss Ms Sir Madam MD Dr Admiral Major General Jr)
  "A list of titles that can appear at the start of a name.")

;; name is a (listof symbol)

;; name -> symbol
(defun last-name (name)
  "Return the last name given a name."
  (let ((reversed-name (reverse name))) 
    (if (member (first reversed-name) *titles*)
	(last-name (reverse (rest reversed-name)))
	(first (last name)))))
