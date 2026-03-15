(defpackage :difference-of-squares
  (:use :cl)
  (:export :sum-of-squares
           :square-of-sum
           :difference))

(in-package :difference-of-squares)

(defun square-of-sum (n)
  "Calculates the square of the sum for a given number."
  (expt (loop for nn from n downto 1 summing nn) 2)
  )

(defun sum-of-squares (n)
  "Calculates the sum of squares for a given number."
  (loop for nn from n downto 1 summing (expt nn 2))
  )

(defun difference (n)
  "Finds the diff. between the square of the sum and the sum of the squares."
  (abs (- (sum-of-squares n) (square-of-sum n))))


