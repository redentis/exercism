(defpackage :allergies
  (:use :cl)
  (:shadow :list)
  (:export :allergic-to-p :list))

(in-package :allergies)

(defvar *allergens* 
  '(("eggs" . 1)
    ("peanuts" . 2)
    ("shellfish" . 4)
    ("strawberries" . 8)
    ("tomatoes" . 16)
    ("chocolate" . 32)
    ("pollen" . 64)
    ("cats" . 128)))

(defun contains (score mask)
  (not (zerop (logand score mask))))

(defun allergic-to-p (score allergen)
  "Returns true if given allergy score includes given allergen."
  (let ((mask (cdr (assoc allergen *allergens* :test #'equal))))
       (when mask
         (contains score mask))))

(defun list (score)
  "Returns a list of allergens for a given allergy score."
  (loop for (allergen . mask) in *allergens*
        when (contains score mask) 
        collect allergen))
