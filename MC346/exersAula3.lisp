;1)-Maior elemento da lista

(defun maioraux(l maiorval)
  (if (null l)
   maiorval
   (if (> (first l) maiorval)
      (maioraux (rest l) (first l) )
      (maioraux (rest l) maiorval )
   )
  )
)

(defun maior(l)
  (maioraux (rest l) (first l))
)
;---------------------------------------------------------------
;2)-ultimo elemento da lista
(defun ultimo(l)
  (if (null (rest l) )
    (first l)
    (ultimo (rest l))
  )
)
;------------------------------------------------------------------------
;3) apenas os elementos nas posições 1 , 3 , 5 ...
(defun intercalaux (l n)
  (if (null l)
  '()
   (if (= (mod n 2) 0)
      (intercalaux (rest l) (+ 1 n))
      (cons (first l) (intercalaux (rest l) (+ 1 n)) )
   )
  )
)

(defun intercala (l)
  (intercalaux l 1)
)

;--------------------------------------------------------------
;4)apenas os elementos positivos da lista

(defun positivos (l)
  (if (null l)
    '()
     (if (> (first l) 0)
       (cons (first l) (positivos (rest l) ) )
       (positivos (rest l) )
     )
  )
)
;--------------------------------------------------
;5) soma dos elementos positivos de uma lista
(defun somapositivosaux (l acc)
  (if (null l)
    acc
    (if (> (first l) 0)
      (somapositivosaux (rest l) (+ acc (first l)))
      (somapositivosaux (rest l) acc)
    )
  )
)

(defun somapositivos (l)
  (somapositivosaux l 0)
)
;------------------------------------------------------
;6) verifica se a lista esta ordenada em ordem crescente
(defun crescenteaux (l anterior)
  (if (null l)
    'T
    (if (> anterior (first l))
      'F
      (crescenteaux (rest l) (first l))
    )
  )
)


(defun crescente (l)
    (crescenteaux (rest l) (first l))
)
;-------------------------------------------------------
;7) shift right usando a funcao ultimo (item 2)
(defun removefim (l)
    (if (null (rest l))
      '()
       (cons (first l) (removefim (rest l) ) )
    )
)

(defun shiftright (l)
  (removefim (cons (ultimo l) l) )
)
;------------------------------------------
;8)shift left
(defun shiftleft (l)
  (append  (cdr l) (list (first l)))
)

;-----------------------------------------------------
;9)inversao usando append, funcao nativa
(defun inv(l)
  (if (null l)
  '()
   (append (inv(rest l)) (list(first l)) )
  )
)
;------------------------------------------------------------
;10)
;quantas vezes um item aparece numna lista
(defun quantasvezesaux (l item acc)
  (if (null l)
    acc
    (if (= (first l) item)
      (quantasvezesaux (rest l) item (+ 1 acc))
      (quantasvezesaux (rest l) item acc)
    )
  )
)

(defun quantasvezes (l item)
  (quantasvezesaux l item 0)
)

;-------------------------------------------------------------
;11) em qual posicao da lista esta o item
(defun emqualposaux (l item pos)
  (if (null l)
    -1
    (if (= (first l) item)
      pos
      (emqualposaux (rest l) item (+ 1 pos) )
    )
  )
)

(defun emqualpos (l item)
  (emqualposaux l item 0)
)

;-----------------------------------------------
;12) remove itens na lista
(defun removeItem (l item)
  (if (null l)
      '()
      (if (= (first l) item)
        (removeItem (rest l) item)
        (cons (first l) (removeItem (rest l) item))
      )
  )
)

;------------------------------------------------
;13 ) replace nos itens da lista
(defun replacelist (l item repl)
  (if (null l)
      '()
      (if (= (first l) item)
        (cons repl (replacelist (rest l) item repl))
        (cons (first l) (replacelist (rest l) item repl))
      ) 
  )
)
