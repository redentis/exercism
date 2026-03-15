(defpackage :word-count
  (:use :cl)
  (:export :count-words))
(in-package :word-count)

(defun count-words (sentence)
  (loop with counts = (make-hash-table :test #'equal)
        for word in (split sentence)
        do (setf (gethash word counts)
                 (+ 1 (gethash word counts 0)))
        finally (return (hash-table-to-alist counts))))

(defun hash-table-to-alist (table)
  (loop for key being each hash-key of table
        collect (cons key (gethash key table))))

(defun split (s)
    (defun __push (start end words)
        "maybe push a non-empty subsequence to words"
        (if (> end start)
            (cons (string-downcase (subseq s start end)) words)
            words))
    (defun __contraction (s position)
        "determine whether the character at the specified position is an apostrophe signalling a contraction"
        (and (char= #\' (elt s position))
             (unless (zerop position)
                 (alphanumericp (elt s (- position 1))))
             (unless (>= position (- (length s) 1))
                 (alphanumericp (elt s (+ position 1))))
             ))
    (defun __rec (start end words)
        (if (>= end (length s))
            (reverse (__push start end words))         
            (if (or (alphanumericp (elt s end)) (__contraction s end))
                (__rec start (+ end 1) words)
                (__rec (+ end 1) (+ end 1) (__push start end words)))))
    (__rec 0 0 '()))