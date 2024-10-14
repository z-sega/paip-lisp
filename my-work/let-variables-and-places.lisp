(defstruct player (score 0) (wins 0))

;; (setf p1 (make-player 3 0))
;; (setf p2 (make-player 1 0))
;; (setf p3 (make-player 0 0))

(defun determine-winner (players)
  "Increment the WINS for the player with highest score."
  (incf (player-wins (first (sort players #'>
				  :key #'player-score)))))
