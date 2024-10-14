(defparameter *simple-grammar*
  '((sentence -> (noun-phrase verb-phrase))
    (noun-phrase -> (Article Noun))
    (verb-phrase -> (Verb noun-phrase))
    (Article -> the a)
    (Noun -> man ball woman table)
    (Verb -> hit took saw liked))
  "A grammar for a trivial subset of English.")

(defvar *grammar* *simple-grammar*
  "This grammar used by generate. Initially, this 
*simple-grammar*, but we can switch to other grammars.")

;; symbol -> symbol
(defun rule-lhs (rule)
  "The left-hand side of a rule."
  (first rule))

(defun rule-rhs (rule)
  "The right-hand side of a rule."
  (rest (rest rule)))

(defun rewrites (category)
  "Return a list of the possible rewrites for this category."
  (rule-rhs (assoc category *grammar*)))

;; A grammar is a (listof category)

;; A category is one of:
;; - (cons symbol (cons -> rewrite))

;; A rewriteable is one of:
;; - (listof phrase)
;; - (list (listof phrase))

;; A phrase is one of:
;; - symbol
;; - rewriteable

;; phrase -> (listof symbol)
;; (defun generate (phrase)
;;   "Generate a random sentence or phrase."
;;   (cond
;;     ((listp phrase) (mappend #'generate phrase))
;;     ((rewrites phrase) (generate (random-elt (rewrites phrase))))
;;     (t (list phrase))))

;; (x -> y) (listof x) -> y
(defun mappend (fn x*)
  "Reduce x's into y based on fn."
  (apply #'append (mapcar fn x*)))

;; ex2.1
;; Write a version of generate that uses cond but avoids
;; calling rewrites twice.

;; phrase -> (listof symbol)
(defun generate (phrase)
  "Generate a random sentence or phrase."
  (let ((choices (rewrites phrase)))
    (cond
      ((listp phrase) (mappend #'generate phrase))
      (choices (generate (random-elt choices)))
      (t (list phrase)))))
