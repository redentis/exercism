(defpackage :lillys-lasagna
  (:use :cl)
  (:export :expected-time-in-oven
           :remaining-minutes-in-oven
           :preparation-time-in-minutes
           :elapsed-time-in-minutes))

(in-package :lillys-lasagna)

;; Define function expected-time-in-oven
(defun expected-time-in-oven ()
  "Calculate the expected time in the oven"
  337)
;; Define function remaining-minutes-in-oven
(defun remaining-minutes-in-oven (m)
  "Calculate the remaining time in the over given the item has been in the over m minutes"
  (- (expected-time-in-oven) m))
;; Define function preparation-time-in-minutes
(defun preparation-time-in-minutes (layers)
  "Calculate the prepartion time based on the given number of layers"
  (* layers 19))
;; Define function elapsed-time-in-minutes
(defun elapsed-time-in-minutes (layers timer)
  "Calculate the elapsed time since starting prepartion to the given time in the oven"
  (+ (preparation-time-in-minutes layers) timer))