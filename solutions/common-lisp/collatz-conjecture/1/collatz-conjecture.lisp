(defpackage :collatz-conjecture
  (:use :cl)
  (:export :collatz))

(in-package :collatz-conjecture)

(defun collatz (n)
  (defun _inner (nn i)
    (if (= 1 nn)
        i
        (if (oddp nn)
            (_inner (+ 1 (* 3 nn)) (+ 1 i))
            (_inner (floor nn 2) (+ 1 i)))))
(when (< 0 n)
  (_inner n 0)))
