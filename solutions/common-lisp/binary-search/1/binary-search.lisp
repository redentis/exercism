(defpackage :binary-search
  (:use :cl)
  (:export :binary-find :value-error))

(in-package :binary-search)

(defun succ (n) (+ n 1))

(defun prev (n) (- n 1))

(defun binary-find (arr el)
  (defun _inner (left right)
    (print (format t "left=~a; right=~a~%" left right))
    (when (<= left right)
    (let ((mid (+ left (floor (- right left) 2))))
         (cond 
           ((= el (aref arr mid)) mid)
           ((< el (aref arr mid)) (_inner left (prev mid)))
           ((> el (aref arr mid)) (_inner (succ mid) right))))))
  (when arr
    (_inner 0 (- (array-dimension arr 0) 1))))
