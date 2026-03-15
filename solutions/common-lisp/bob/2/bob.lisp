(defpackage :bob
  (:use :cl)
  (:export :response))
(in-package :bob)

(defun response (hey-bob)
  (let ((trimmed (trim hey-bob)))
    (cond
      ((and (shouty-p trimmed) (question-p trimmed)) "Calm down, I know what I'm doing!")
      ((question-p trimmed)                          "Sure.")
      ((shouty-p trimmed)                            "Whoa, chill out!")
      ((blank-p trimmed)                             "Fine. Be that way!")
      (t                                             "Whatever."))))

(defun question-p (s)
  (zerop (mismatch "?" s :from-end t)))

(defun shouty-p (s)
  (let ((test (remove-if-not #'alpha-char-p s)))
       (print test)
       (When (not (zerop (length test)))
             (every #'upper-case-p test))))

(defun blank-p (s)
  "Is s nil or only contains whitespaces ?"
  (or (null s) (string-equal "" (trim s))))

(defun trim (s)
  (string-trim '(#\Space #\Tab #\Newline) s))