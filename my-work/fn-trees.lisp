(defun same-shape-tree (a b)
  "Are two trees the same except for the leaves?"
  (labels ((true (&rest ignore) (princ ignore) t))
    (tree-equal a b :test #'true)))

(defun english->french (words)
  (sublis '((are . va)
	    (book . libre)
	    (friend . ami)
	    (hello . bonjour)
	    (how . comment)
	    (my . mon)
	    (red . rouge)
	    (you . tu))
	  words))

(defun nada-max (&rest args)
  (princ args)
  (apply #'max args))
