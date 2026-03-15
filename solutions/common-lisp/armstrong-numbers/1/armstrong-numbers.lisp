(defpackage :armstrong-numbers
  (:use :cl)
  (:export :armstrong-number-p))
(in-package :armstrong-numbers)

(defun digits (number)
  (loop :for n := number :then (floor n 10)
        :while (> n 0)
        :collect (rem n 10) :into digits
        :finally (return (nreverse (or digits '(0))))))

(defun armstrong (number)
  (let* ((ds (digits number))
         (n (length ds)))
    (loop :for d in ds
            :summing (expt d n))))

(defun armstrong-number-p (number)
      (let ((an (armstrong number)))
          (values (= number an) an)))
