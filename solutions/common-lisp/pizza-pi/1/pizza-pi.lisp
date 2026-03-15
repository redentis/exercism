(defpackage :pizza-pi
  (:use :cl)
  (:export :dough-calculator :pizzas-per-cube
           :size-from-sauce :fair-share-p))

(in-package :pizza-pi)

(defun dough-calculator (pizzas diameter)
  (round (* pizzas (+  (/ (* 45 pi diameter) 20) 200))))

(defun size-from-sauce (sauce)
  (let ((area (* 10 (/ sauce 3))))
      (* 2 (sqrt (/ area pi))))
)

;; calculate how many pizzas they can make using any given cheese cube.
;; Mozzarella cheese has a density of 0.5 grams per cubic centimeter and
;; every pizza needs 3 grams of cheese per square centimeter. Given the
;; side-length of some cheese cube and the pizzas' diameter, calculate
;; the number of pizzas that can be made (always rounded down).

(defun pizzas-per-cube (cube-size diameter)
   (let* ((mozzarella-density 0.5)
         (r             (/ diameter 2))
         (pizza-area    (* pi r r))
         (pizza-cheeze  (* pizza-area 3))
         (cheeze-volume (* cube-size cube-size cube-size))
         (cheeze        (* cheeze-volume mozzarella-density)))
      (floor (/ cheeze pizza-cheeze))
      ))

(defun fair-share-p (pizzas friends)
   (zerop (rem (* pizzas 8) friends))
  )
