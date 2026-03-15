(defpackage :rna-transcription
  (:use :cl)
  (:export :to-rna))
(in-package :rna-transcription)

(deftype rna () 'string)

(defun rna_complement (nucleotide)
  (case nucleotide
         (#\G #\C)
         (#\C #\G)
         (#\T #\A)
         (#\A #\U)
         (otherwise (error "unknown nucleotide: " nucleotide))))

(defun to-rna (str)
  "Transcribe a string representing DNA nucleotides to RNA."
  (map 'rna #'rna_complement str))
