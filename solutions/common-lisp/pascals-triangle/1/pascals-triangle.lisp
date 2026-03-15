(defpackage :pascals-triangle
  (:use :cl)
  (:export :rows))
(in-package :pascals-triangle)

(defun calc (row p)
  (let ((a (- p 1))
        (sum 0)
        (d (length row)))
    ;(print (format nil "calc: row=~a; a=~a; p=~a~%" row a p))
    (when (< -1 a)
          (setf sum (+ sum (elt row a))))
    (when (< p d)
          (setf sum (+ sum (elt row p))))
    sum))

(defun calculate_row (row_count row_n prev_rows)
  (print (format nil "calculate_row: row_n=~a; prev_rows=~a~%" row_n prev_rows))
  (if (> row_n row_count)
      (nreverse prev_rows)
      (let ((row (loop with p = (car prev_rows)
                       for i from 0 below row_n
                         collecting (calc p i))))
        (calculate_row row_count
                       (+ row_n 1)
                       (cons row prev_rows)))))
(defun rows (n)
  (cond
   ((< n 1) nil)
   ((= 1 n) '((1)))
   (t (calculate_row n 2 (list '(1))))))
