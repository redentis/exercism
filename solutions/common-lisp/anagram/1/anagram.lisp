(defpackage :anagram
  (:use :cl)
  (:export :anagrams-for))

(in-package :anagram)

(defun normalize (word)
  (string-downcase word))

(defun reorder (word)
  (sort (copy-seq word) #'char-lessp))

(defun anagrams-for (subject candidates)
  "Returns a sublist of candidates which are anagrams of the subject."
  (let* ((normal-subject    (normalize subject))
         (subject-hash      (reorder normal-subject)))
        (remove-if
          (lambda (s)
                  (let ((normal-s (normalize s)))
                       (or (equal normal-subject normal-s)
                           (not (equal subject-hash (reorder normal-s))))))
          candidates)))
