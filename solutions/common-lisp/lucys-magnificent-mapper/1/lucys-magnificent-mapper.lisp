(defpackage :lucys-magnificent-mapper
  (:use :cl)
  (:export :make-magnificent-maybe :only-the-best))

(in-package :lucys-magnificent-mapper)

;; Define make-magnificent-maybe function
(defun make-magnificent-maybe (f ns)
  (mapcar f ns))

;; Define only-the-best function
(defun only-the-best (f ns)
  (remove-if f (remove 1 ns)))