(defpackage :grains
  (:use :cl)
  (:export :square :total))
(in-package :grains)

(defun dbl (n)
  (* 2 n))

(defun square (n)
  (defun __inner (a s)
    (cond
     ((= s n) a)
     (t (__inner (dbl a) (+ 1 s)))))
  (when (< 0 n)
        (__inner 1 1)))

(defun total () 
  (loop for s from 1 upto 64 summing (square s)))
