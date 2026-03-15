(defpackage :all-your-base
  (:use :cl)
  (:export :rebase))

(in-package :all-your-base)

(defun number-from-base (base digits)
    (when (and (> base 1) (every (lambda (d) (and (<= 0 d) (< d base))) digits))
        (loop for i from 0
                and d in (reverse digits)
                sum (* d (expt base i)))))

(defun number-to-base (base n)
    (defun _inner (nn ds)
        (if (zerop nn)
            ds
            (multiple-value-bind (r q) (floor nn base)
                (print (format t "r=~a; q=~a`%" r q))
                (_inner r (cons q ds)))))
    (cond
      ((not n) '())
      ((zerop n) '(0))
      ((> base 1) (_inner n '()))
      (t '())))

(defun rebase (list-digits in-base out-base)
  (cond
    ((or (zerop in-base) (zerop out-base)) '())
    ((not list-digits) '(0))
    (t (number-to-base out-base (number-from-base in-base list-digits)))))
