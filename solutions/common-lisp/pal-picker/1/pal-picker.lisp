(defpackage :pal-picker
  (:use :cl)
  (:export :pal-picker :habitat-fitter :feeding-time-p
           :pet :play-fetch))

(in-package :pal-picker)

(defun pal-picker (personality-type)
  (case personality-type
    (:lazy "Cat")
    (:quiet "Fish")
    (:energetic "Dog")
    (:hungry "Rabbit")
    (:talkative "Bird")
    (t "I don't know... A dragon?")))

(defun habitat-fitter (weight)
  (cond
    ((>= weight 40) :massive)
    ((<= 20 weight 39) :large)
    ((<= 10 weight 19) :medium)
    ((<= 1 weight 9)   :small)
    ((<= weight 0)          :just-your-imagination)))

(defun feeding-time-p (fullness)
  (cond
    ((> fullness 20) "All is well.")
    (t "It's feeding time!")))

(defun pet (pet)
  (if (string= "Fish" pet)
      "Maybe not with this pet..."
      nil))

(defun play-fetch (pet)
    (if (not (string= "Dog" pet))
      "Maybe not with this pet..."
      nil))
