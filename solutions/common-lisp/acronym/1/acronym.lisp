(defpackage :acronym
  (:use :cl)
  (:export :acronym))

(in-package :acronym)

(defun acronym (s)
    (if (> (length s) 0)
      (format nil
              "~{~a~}"
              (loop for word in (split s)
                    collect (char-upcase (elt word 0))))
      ""))

(defun space-or-hyphen-separator-p (c)
    (or (char= #\Space c) (char= #\- c)))

(defun split-on (separator-p s)
    (loop for start = 0 then (+ 1 end)
          as end = (position-if separator-p s :start start)
          collect (subseq s start end)
          while end))

(defun split (s)
    (split-on #'space-or-hyphen-separator-p s))
