;;   This allows the powermate dial to be used to rotate the view in coot, in +/- x,y,z.
;;   The F1 key rotates forward, and the F2 key rotates in reverse.  The F3 key permutes the
;;   direction of rotation from x to y to z to x. To use this, assign F1/F2 to left/right rotation,
;;   and F3 to push down in the Powermate Driver software.
;;   
;;   William Scott and Alastair Fyfe, Sept. 12, 2007.

;; Set the initial direction to y
(define direction 2)

(define graphics-general-key-press-hook
   (lambda (key)
      (format #t "key: ~s~%" key)
         (cond

        ;; Bind the F3 key to toggle direction
   ((= key 65472) (cond
           ((= direction 1) (set! direction 2 ))
           ((= direction 2) (set! direction 3 ))
           ((= direction 3) (set! direction 1 ))
             ))


   ;; bind the F1 key, action depends on the current value of variable "direction"
   ((= key 65470) (cond
           ((= direction 1) (rotate-x-scene 1 3.0 ))
           ((= direction 2) (rotate-y-scene 1 3.0 ))
           ((= direction 3) (rotate-z-scene 1 3.0 ))
             ))
  ;; bind the F2 key, action depends on the current value of variable "direction"
   ((= key 65471) (cond
           ((= direction 1) (rotate-x-scene 1 -3.0 ))
           ((= direction 2) (rotate-y-scene 1 -3.0 ))
           ((= direction 3) (rotate-z-scene 1 -3.0 ))
             ))

			 ;; Toggle stereo but avoid clobbering defaults
			    ;; bind the S (shift-s) key to get Stereo
			    ((= key 83) (zalman-stereo-mode ))
			    ;; bind the M (shift-m) key to get Mono
			    ((= key 77) (mono-mode))
			                  ))
                   ) 

