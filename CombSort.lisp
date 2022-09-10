(defun updateGap (gap)
  (if (equal gap 1)
      (return-from updateGap 0))
  (setq gap (truncate (/ gap 1.3)))
  (if (< gap 1)
      (return-from updateGap 1))
  gap
)

(defun combsort(elementsList)
  (let ((gap (length elementsList)) (changesElementsList))
    (loop
       (dotimes (counter (- (length elementsList) gap)) 
       (if (> (nth counter elementsList) (nth (+ counter gap) elementsList))
           (let ((minor (nth (+ counter gap) elementsList)) (major (nth counter elementsList)))
             (setf (nth (+ counter gap) elementsList) major)
             (setf (nth counter elementsList) minor))
         (setq changesElementsList (+ changesElementsList 1)))
       )
     (print elementsList)
     (setq gap (updateGap gap))
     (setq changesElementsList 0)
     (when (AND (equal gap 0) (equal changesElementsList 0)) (return elementsList) )
       )
    )
)
