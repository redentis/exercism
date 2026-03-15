(defpackage :leap
  (:use :cl)
  (:export :leap-year-p))
(in-package :leap)

(defun leap-year-p (year)
  ;; unless => if false, evaluate the forms, else return nil
  ;; when   => if true, evaluate the form(s), else return nil
  (if (zerop (mod year 4))
    (if (zerop (mod year 100))
      (if (zerop (mod year 400))
          t
          nil)
      t)
    nil))
