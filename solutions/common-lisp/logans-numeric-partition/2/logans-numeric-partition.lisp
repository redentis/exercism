(defpackage :logans-numeric-partition
  (:use :cl)
  (:export :categorize-number :partition-numbers))

(in-package :logans-numeric-partition)

;; Define categorize-number function
(defun categorize-number (p n)
  (if (evenp n)
      (cons (car p)          (cons n (cdr p)))
      (cons (cons n (car p)) (cdr p))))

;; Define partition-numbers function
(defun partition-numbers (ns)
  (reduce #'categorize-number ns :initial-value (cons () ())))