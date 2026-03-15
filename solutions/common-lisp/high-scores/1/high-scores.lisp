(defpackage :high-scores
  (:use :cl)
  (:export :make-high-scores-table :add-player
           :set-score :get-score :remove-player))

(in-package :high-scores)

;; Define make-high-scores-table function
(defun make-high-scores-table ()
  (make-hash-table))

;; Define add-player function
(defun add-player (hst n)
  (set-score hst n 0))

;; Define set-score function
(defun set-score (hst n score)
  (setf (gethash n hst) score))

;; Define get-score function
(defun get-score (hst n)
    (gethash n hst 0))

;; Define remove-player function
(defun remove-player (hst n)
  (remhash n hst))
