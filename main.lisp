
(defstruct tuple
    x
    y
)

(defun createTuple (a b)
    (setq tup
        (make-tuple
            :x a
            :y b
        )
    )
    tup ;retorna a tupla
)

(defvar tabuleiro (make-array '(8 8)
    :initial-contents '((0 0 0 3 0 0 2 0)
                        (4 0 0 0 0 0 0 0)
                        (0 2 0 0 0 0 0 0)
                        (0 1 5 0 0 1 5 0)
                        (0 2 0 0 0 0 0 0)
                        (0 0 0 0 4 0 0 4)
                        (0 0 0 0 0 3 0 0)
                        (0 5 0 0 0 5 0 0)))
)

(defvar regioes (make-array '(13 5)
      :initial-contents '(((createTuple (0 0)) (createTuple (0 1)) (createTuple (0 2)) (createTuple (1 0) NIL)))
                          ((createTuple (0 3)) (createTuple (1 3)) (createTuple (2 3)) (createTuple (2 2)) (createTuple (3 3)) )
                          ((createTuple (0 4)) (createTuple (0 5)) (createTuple (1 4)) (createTuple (1 5)) (createTuple (2 4)) )
                          ((createTuple (0 6)) (createTuple (0 7)) (createTuple (1 6)) (createTuple (1 7)) (createTuple (2 7)) )
                          ((createTuple (1 1)) (createTuple (1 2)) (createTuple (2 1)) (createTuple (2 0)) (createTuple (3 0)) )
                          ((createTuple (3 1)) (createTuple (3 2)) (createTuple (4 2)) (createTuple (4 3)) (createTuple (5 3)) )
                          ((createTuple (3 4)) (createTuple (3 5)) (createTuple (4 4)) (createTuple (5 4)) (createTuple (6 4)) )
                          ((createTuple (2 5)) (createTuple (2 6)) (createTuple (3 6)) (createTuple (3 7)) (createTuple (4 7)) )
                          ((createTuple (4 0)) (createTuple (4 1)) (createTuple (5 1)) (createTuple (5 2)) (createTuple (6 2)) )
                          ((createTuple (4 5)) (createTuple (4 6)) (createTuple (5 6)) (createTuple (5 7)) (createTuple (6 7)) )
                          ((createTuple (5 0)) (createTuple (6 0)) (createTuple (6 1)) (createTuple (7 0)) (createTuple (7 1)) )
                          ((createTuple (7 2)) (createTuple (7 3)) (createTuple (6 3)) (createTuple (7 4)) (createTuple (7 5)) )
                          ((createTuple (5 5)) (createTuple (6 5)) (createTuple (6 6)) (createTuple (7 6)) (createTuple (7 7)) )))
)

(defun checarCasasOrtogonais (i  j  n  tamanhoLinha  tamanhoColuna)
    (if (= i 0) ; i == 0
        (if (= j 0) ; i == 0 j == 0
          (if (= (aref (tabuleiro i (+ j 1)) n))
            NIL
            (if (= (aref (tabuleiro (+ i 1) j) n))
              NIL
              T
            )
          )
          (if (and (> j 0) (< j (- tamanhoColuna 1))) ; i == 0 (j > 0) and (j < (tamanhoColuna-1))
            (if (= (aref (tabuleiro i (- j 1)) n))
              NIL
              (if (= (aref (tabuleiro i (+ j 1)) n))
                NIL
                (if (= (aref (tabuleiro (+ i 1) j) n))
                  NIL
                  T
                )
              )
            )
            (if (= j (- tamanhoColuna 1)) ; i == 0 j == (tamanhoColuna-1)
              (if (= (aref (tabuleiro i (- j 1)) n))
                  NIL
                  (if (= (aref (tabuleiro (- i 1) j) n))
                    NIL
                    T
                  )
              )
            )
          )
        )
        (if (and (> i 0) (< i (- tamanhoLinha 1))) ; (i > 0) and (i < (tamanhoLinha-1))
          (if (= j 0) ; (i > 0) and (i < (tamanhoLinha-1)) j == 0
            (if (= (aref (tabuleiro i (+ j 1)) n))
              NIL
              (if (= (aref (tabuleiro (+ i 1) j) n))
                NIL
                T
              )
            )
            (if (and (> j 0) (< j (- tamanhoColuna 1))) ; (i > 0) and (i < (tamanhoLinha-1)) (j > 0) and (j < (tamanhoColuna-1))
              (if (= (aref (tabuleiro i (- j 1)) n))
                NIL
                (if (= (aref (tabuleiro i (+ j 1)) n))
                  NIL
                  (if (= (aref (tabuleiro (+ i 1) j) n))
                    NIL
                    T
                  )
                )
              )
              (if (= j (- tamanhoColuna 1)) ; (i > 0) and (i < (tamanhoLinha-1)) j == (tamanhoColuna-1)
                (if (= (aref (tabuleiro i (- j 1)) n))
                    NIL
                    (if (= (aref (tabuleiro (- i 1) j) n))
                      NIL
                      T
                    )
                )
              )
        )
      )
      (if (= i (- tamanhoLinha 1))
        (if (= j 0) ; i == (tamanhoLinha-1) and (i < (tamanhoLinha-1)) j == 0
            (if (= (aref (tabuleiro i (+ j 1)) n))
              NIL
              (if (= (aref (tabuleiro (+ i 1) j) n))
                NIL
                T
              )
            )
            (if (and (> j 0) (< j (- tamanhoColuna 1))) ; i == (tamanhoLinha-1) and (i < (tamanhoLinha-1)) (j > 0) and (j < (tamanhoColuna-1))
              (if (= (aref (tabuleiro i (- j 1)) n))
                NIL
                (if (= (aref (tabuleiro i (+ j 1)) n))
                  NIL
                  (if (= (aref (tabuleiro (+ i 1) j) n))
                    NIL
                    T
                  )
                )
              )
              (if (= j (- tamanhoColuna 1)) ; i == (tamanhoLinha-1) and (i < (tamanhoLinha-1)) j == (tamanhoColuna-1)
                (if (= (aref (tabuleiro i (- j 1)) n))
                    NIL
                    (if (= (aref (tabuleiro (- i 1) j) n))
                      NIL
                      T
                    )
                )
              )
        )
          )
        )
    )
  )
)

(defun checarCasasDiagonais (i  j  n  tamanhoLinha  tamanhoColuna)
    ;##################------------- todo copiar, colar e ajustar checarCasasOrtogonais aqui ------------#########################
)

(defun percorreArea (area n)
  (loop for tupla in area
    (if (= (aref (tabuleiro (tuple-x tupla) (tuple-y tupla)) n))
      NIL
    )
  )
  T
)

(defun possibilidade (i  j  n  tamanhoLinha  tamanhoColuna  area)
    (if(= (checarCasasOrtogonais (i  j  n  tamanhoLinha  tamanhoColuna)) NIL)
        NIL
        (if(= (checarCasasDiagonais (i  j  n  tamanhoLinha  tamanhoColuna)) NIL)
            NIL
            (percorreArea area n)
        )
    )
)

(defun main()
  (loop for area in regioes
    (loop for tupla in area
      (let ((i (tuple-x tupla)) (j (tuple-y tupla))))

      (if  (= (aref (tabuleiro i j) 0))

        ;##############----------- todo for n in range(1, len(area)+1).... -------------#############

      )
    )
  )
)

(main)
