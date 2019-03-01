;matrix
;1) main diag of a matrix

(defun get_item_aux(l pos current_pos)
    (if (null (first l) )
       nil
       (if (= pos current_pos)
          (first l)
          (get_item_aux (rest l) pos (+ 1 current_pos))
       )
    )
)

(defun get_item(l pos)
  (get_item_aux l pos 0)
)

(defun diag_aux(m n)
    (if (null (first m))
      '()
       (if (atom (first m))
          (diag_aux (rest l) pos)
          (cons (get_item (first m) n ) (diag_aux (rest m) (+ 1 n) ) )
       )

    )
)

(defun diag(m)
  (diag_aux m 0)
)

;2) transpose of a matrix

(defun transpose_line (m n)
  (if (null m)
      '()
      (if (atom (first m))
        (transpose_line (rest m) n)
        (let* (
                (elem (get_item (first m) n))
              )
          (if (null elem)
             (transpose_line (rest m) n)
             (cons elem (transpose_line (rest m) n) )
          )
        )
      )
  )
)

(defun transpose_matrix_aux(m n)
  (let* (
          (transposed_line (transpose_line m n))
        )

      (if (null transposed_line)
         '()

          (append (list transposed_line) (transpose_matrix_aux m (+ 1 n)))
      )
  )
)

(defun transpose_matrix(m)
  (transpose_matrix_aux m 0)
)
