;; A Sentence is (append NounPhrase VerbPhrase)

;; A NounPhrase is (append Article Adj* Noun PP*)

;; An Article is one of:
;; - ...

;; An Adj* is one of:
;; - nil
;; - (cons Adj Adj*)

;; An Adj is one of:
;; - ...

;; A PP* is one of:
;; - nil
;; - (cons PP PP*)

;; A PP is (append Prep NounPhrase)

;; A Prep is one of:
;; - ...

;; A VerbPhrase is (append Verb NounPhrase)
;; A Verb is one of:
;; - ...

(defun sentence () (append (noun-phrase) (verb-phrase)))
(defun verb-phrase () (append (Verb) (noun-phrase)))
(defun Article () (one-of '(the a)))
(defun Noun () (one-of '(man ball woman table)))
(defun Verb () (one-of '(hit took saw liked)))

(defun Adj* ()
  "Compute nil or a list of one or more Adj."
  (if (= (random 2) 0)
      nil
      (append (Adj) (Adj*))))

(defun PP* ()
  "Compute nil or a list of one or more PP."
  (if (= (random 2) 0)
      nil
      (append (PP) (PP*))))

(defun noun-phrase () (append (Article) (Adj*) (Noun) (PP*)))

(defun PP () (append (Prep) (noun-phrase)))
(defun Adj () (one-of '(big little blue green adiabatic)))
(defun Prep () (one-of '(to in by with on)))

;; (listof X) -> (list X)
(defun one-of (set)
  "Pick one element of set, and make a list of it."
  (list (random-elt set)))

;; (listof X) -> X
(defun random-elt (choices)
  "Choose an element from a list at random."
  (elt choices (random (length choices))))
