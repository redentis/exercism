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

  ;; While LOOP-FINISH can be used can be used in a variety of 
;; situations it is really most needed in a situation where a need
;; to exit is detected at other than the loop's `top level'
;; (where UNTIL or WHEN often work just as well), or where some 
;; computation must occur between the point where a need to exit is
;; detected and the point where the exit actually occurs.  For example:
 (defun tokenize-sentence (string)
   (macrolet ((add-word (wvar svar)
                `(when ,wvar
                   (push (coerce (nreverse ,wvar) 'string) ,svar)
                   (setq ,wvar nil))))
     (loop with word = '() and sentence = '() and endpos = nil
           for i below (length string)
           do (let ((char (aref string i)))
                (case char
                  (#\Space (add-word word sentence))
                  (#\. (setq endpos (1+ i)) (loop-finish))
                  (otherwise (push char word))))
           finally (add-word word sentence)
                   (return (values (nreverse sentence) endpos)))))