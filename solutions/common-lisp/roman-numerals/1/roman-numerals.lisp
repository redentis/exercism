(defpackage :roman-numerals
  (:use :cl)
  (:export :romanize))

(in-package :roman-numerals)

(defconstant *value-mapping*
  '((1000 "M")
    (900  "CM")
    (500  "D")
    (400  "CD")
    (100  "C")
    (90   "XC")
    (50   "L")
    (40   "XL")
    (10   "X")
    (9    "IX")
    (5    "V")
    (4    "IV")
    (1    "I")))

(defun romanize-by-radix (number)
  "Returns the Roman numeral representation for a given number."
  (defun process (letters num radix)
    (when (and letters num)
      (cons (make-string (rem num radix) :initial-element (car letters))
            (process (cdr letters) (floor (/ num radix)) (- 7 radix)))))
  (format nil "~{~a~^~}" (process (list #\I #\V #\X #\L #\C #\D #\M) number 5))
  )

(defun romanize (number)
  "Returns the Roman numeral representation for a given number."
   (defun process (letters num result)
     (if (and letters num)
       (destructuring-bind (current roman) (car letters)
         (if (>= num current)
             (process letters (- num current) (cons roman result))
             (process (cdr letters) num result)))
       result))
  (format nil "~{~a~^~}" (reverse (process *value-mapping* number '()))))

;; function toRoman1(num) {
;;   const letters = ['I', 'V', 'X', 'L', 'C', 'D', 'M'];
;;   let result = '';
;;   for(let radix = 5; num; radix ^= 7) {
;;     result += letters.shift().repeat(num % radix) + result;
;;     num = Math.floor(num / radix);
;;   }
;;   return result;
;; }