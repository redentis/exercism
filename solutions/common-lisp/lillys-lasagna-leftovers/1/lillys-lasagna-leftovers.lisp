(defpackage :lillys-lasagna-leftovers
  (:use :cl)
  (:export
   :preparation-time
   :remaining-minutes-in-oven
   :split-leftovers))

(in-package :lillys-lasagna-leftovers)

;; Define function preparation-time
(defun preparation-time (&rest layers)
  (* 19 (length layers)))
;; Define function remaining-minutes-in-oven
(defun remaining-minutes-in-oven (&optional (adjustment :normal) (standard-time 337))
  (if adjustment
    (case adjustment
      (:normal      standard-time)
      (:very-short  (- standard-time 200))
      (:shorter     (- standard-time 100))
      (:longer      (+ standard-time 100))
      (:very-long   (+ standard-time 200))
      (otherwise    standard-time))
    0))
;; Define function split-leftovers
(defun split-leftovers (&key (weight nil weight-p) (human 10) (alien 10))
  (if weight-p
    (if weight
        (- weight (+ human alien))
        :looks-like-someone-was-hungry)
    :just-split-it))