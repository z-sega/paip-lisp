(defparameter *simple-grammar*
  '((sentence -> (noun-phrase verb-phrase))
    (noun-phrase -> (Article Adj* Noun PP*) (Name) (Pronoun))
    (verb-phrase -> (Verb noun-phrase PP*))
    (PP* -> () (PP PP*))
    (Adj* -> () (Adj Adj*))
    (PP -> (Prep noun-phrase))
    (Prep -> to in by with on)
    (Adj -> big little blue green adiabatic)
    (Article -> the a)
    (Name -> Pat Kim Lee Terry Robin)
    (Noun -> man ball woman table)
    (Verb -> hit took saw liked)
    (Pronoun -> he she it these those that))
  "A grammar for a trivial subset of English.")

(defparameter *simple-grammar*
  '((sentence -> (noun-phrase verb-phrase))
    (noun-phrase -> (Article Noun))
    (verb-phrase -> (Verb noun-phrase))
    (Article -> the a)
    (Noun -> man ball woman table)
    (Verb -> hit took saw liked))
  "A grammar for a trivial subset of English.")

(defparameter *bigger-grammar*
  '((sentence -> (noun-phrase verb-phrase))
    (noun-phrase -> (Article Adj* Noun PP*) (Name) (Pronoun))
    (verb-phrase -> (Verb noun-phrase PP*))
    (PP* -> () (PP PP*))
    (Adj* -> () (Adj Adj*))
    (PP -> (Prep noun-phrase))
    (Prep -> to in by with on)
    (Adj -> big little blue green adiabatic)
    (Article -> the a)
    (Name -> Pat Kim Lee Terry Robin)
    (Noun -> man ball woman table)
    (Verb -> hit took saw liked)
    (Pronoun -> he she it these those that))
  "A grammar for a trivial subset of English.")

(defvar *grammar* *bigger-grammar*
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

(defun one-of (set)
  "Pick one element of set, and make a list of it."
  (list (random-elt set)))

(defun random-elt (choices)
  "Choose an element from a list at random."
  (elt choices (random (length choices))))

;; A grammar is a (listof category)

;; A category is one of:
;; - (cons symbol (cons -> rewrite))

;; A rewriteable is one of:
;; - (listof phrase)
;; - (listof (listof phrase))

;; A phrase is one of:
;; - symbol
;; - rewriteable

;; phrase -> (listof symbol)
(defun generate (phrase)
  "Generate a random sentence or phrase."
  (cond
    ((listp phrase) (mappend #'generate phrase))
    ((rewrites phrase) (generate (random-elt (rewrites phrase))))
    (t (list phrase))))

(defun generate-tree (phrase)
  "Generate a random sentence or phrase, 
with a complete parse tree."
  (cond
    ((listp phrase) (mapcar #'generate-tree phrase))
    ((rewrites phrase)
     (cons phrase
	   (generate-tree (random-elt (rewrites phrase)))))
    (t (list phrase))))

(defun generate-all (phrase)
  "Generate a list of all possible expansions of this phrase."
  (cond
    ((null phrase) (list nil))
    ((listp phrase) (combine-all (generate-all (first phrase))
				 (generate-all (rest phrase))))
    ((rewrites phrase) (mappend #'generate-all (rewrites phrase)))
    (t (list (list phrase)))))

(defun combine-all (xlist ylist)
  "Return a list of lists formed by appending a y to an x.
E.g., (combine-all '((a) (b)) '((1) (2)))
-> ((A 1) (B 1) (A 2) (B 2))"
  (cross-product #'append xlist ylist))

;; (listof x) (listof y) -> (listof (list x y))
(defun cross-product (fn a* b*)
  "Return the list of all (fn a b) values from a* & b*."
  (apply #'append
	 (mapcar #'(lambda (a)
		     (mapcar #'(lambda (b) (funcall fn a b))
			     b*))
		 a*)))

;; (x -> y) (listof x) -> y
(defun mappend (fn x*)
  "Reduce x's into y based on fn."
  (apply #'append (mapcar fn x*)))


;;; Testing
;; (ql:quickload "fiveam")

;; (in-package :cl-user)
;; (defpackage my-test
;;   (:use :cl
;; 	:fiveam))
;; (in-package :my-test)

;; (def-suite my-system
;;   :description "my-system")

;; (5am:test mappend-test
;;   (5am:is (= 2 (+ 1 1))))
