(setq tabuleiro (make-array '(8 8)
    :initial-contents '((0 0 0 3 0 0 2 0)
                        (4 0 0 0 0 0 0 0)
                        (0 2 0 0 0 0 0 0)
                        (0 1 5 0 0 1 5 0)
                        (0 2 0 0 0 0 0 0)
                        (0 0 0 0 4 0 0 4)
                        (0 0 0 0 0 3 0 0)
                        (0 5 0 0 0 5 0 0)
                        )
  )
)

(setq regioes (make-array '(13 5)
    :initial-contents '(
      ((0 0) (0 1) (0 2) (1 0) NIL)
      ((0 3) (1 3) (2 3) (2 2) (3 3))
      ((0 4) (0 5) (1 4) (1 5) (2 4))
      ((0 6) (0 7) (1 6) (1 7) (2 7))
      ((1 1) (1 2) (2 1) (2 0) (3 0))
      ((3 1) (3 2) (4 2) (4 3) (5 3))
      ((3 4) (3 5) (4 4) (5 4) (6 4))
      ((2 5) (2 6) (3 6) (3 7) (4 7))
      ((4 0) (4 1) (5 1) (5 2) (6 2))
      ((4 5) (4 6) (5 6) (5 7) (6 7))
      ((5 0) (6 0) (6 1) (7 0) (7 1))
      ((7 2) (7 3) (6 3) (7 4) (7 5))
      ((5 5) (6 5) (6 6) (7 6) (7 7))
    )
  )
)

(defun checarCasasOrtogonais(i j n tamanhoLinha tamanhoColuna)
  (setq r0 T)
  (if (= i 0)
    (progn
      (if (= j 0)
        (progn
          (if (= (aref tabuleiro i (+ j 1)) n)
            (setq r0 NIL)
          )
          (if (= (aref tabuleiro (+ i 1) j) n)
            (setq r0 NIL)
          )
        )
        (if (and (> j 0) (< j (- tamanhoColuna 1)))
          (progn
            (if (= (aref tabuleiro i (- j 1)) n)
              (setq r0 NIL)
            )
            (if (= (aref tabuleiro i (+ j 1)) n)
              (setq r0 NIL)
            )
            (if (= (aref tabuleiro (+ i 1) j) n):
              (setq r0 NIL)
            )
          )
          (if (= j (- tamanhoColuna 1))
            (if (= (aref tabuleiro i (- j 1)) n)
              (setq r0 NIL)
            )
          )
        )
      )
    )
    (if (and (> i 0) (< i (- tamanhoLinha 1)))
      (progn
        (if (= j 0)
          (progn
            (if (= (aref tabuleiro (- i 1) j) n)
              (setq r0 NIL)
            )
            (if (= (aref tabuleiro i (+ j 1)) n)
              (setq r0 NIL)
            )
            (if (= (aref tabuleiro (+ i 1) j) n)
              (setq r0 NIL)
            )
          )
          (if (and (> j 0) (< j (- tamanhoColuna 1)))
            (progn
              (if (= (aref tabuleiro i (- j 1)) n)
                (setq r0 NIL)
              )
              (if (= (aref tabuleiro (- i 1) j) n)
                (setq r0 NIL)
              )
              (if (= (aref tabuleiro i (+ j 1)) n)
                (setq r0 NIL)
              )
              (if (= (aref tabuleiro (+ i 1) j)  n)
                (setq r0 NIL)
              )
            )
            (if (= j (- tamanhoColuna 1))
              (progn
                (if (= (aref tabuleiro i (- j 1)) n)
                  (setq r0 NIL)
                )
                (if (= (aref tabuleiro (- i 1) j) n)
                  (setq r0 NIL)
                )
                (if (= (aref tabuleiro (+ i 1) j) n)
                  (setq r0 NIL)
                )
              )
            )
          )
        )
      )
      (if (= i (- tamanhoLinha 1))
        (progn
          (if (= j 0)
            (progn
              (if (= (aref tabuleiro (- i 1) j) n):
                (setq r0 NIL)
              )
              (if (= (aref tabuleiro i (+ j 1)) n):
                (setq r0 NIL)
              )
            )
            (if (and (> j 0) (< j (- tamanhoColuna 1)))
              (progn
                (if (= (aref tabuleiro i (- j 1)) n)
                  (setq r0 NIL)
                )
                (if (= (aref tabuleiro (- i 1) j) n)
                  (setq r0 NIL)
                )
                (if (= (aref tabuleiro i (+ j 1)) n)
                  (setq r0 NIL)
                )
              )
              (if (= j (- tamanhoColuna 1))
                (progn
                  (if (= (aref tabuleiro i (- j 1)) n)
                    (setq r0 NIL)
                  )
                  (if (= (aref tabuleiro (- i 1) j) n)
                    (setq r0 NIL)
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  r0
)

(defun checarCasasDiagonais(i j n tamanhoLinha tamanhoColuna)
  (setq r1 T)
  (if (= i 0)
    (progn
      (if (= j 0)
        (if (= (aref tabuleiro (+ i 1) (+ j 1)) n)
          (setq r1 NIL)
        )
        (if (and (> j 0) (< j (- tamanhoColuna 1)))
          (progn
            (if (= (aref tabuleiro (+ i 1) (- j 1)) n)
              (setq r1 NIL)
            )
            (if (= (aref tabuleiro (+ i 1) (+ j 1)) n)
              (setq r1 NIL)
            )
          )
          (if (= j (- tamanhoColuna 1)):
            (if (= (aref tabuleiro (+ i 1) (- j 1)) n)
              (setq r1 NIL)
            )
          )
        )
      )
    )
    (if (and (> i 0) (< i (- tamanhoLinha 1)))
      (progn
        (if (= j 0)
          (progn
            (if (= (aref tabuleiro (- i 1) (+ j 1)) n)
              (setq r1 NIL)
            )
            (if (= (aref tabuleiro (+ i 1) (+ j 1) ) n)
              (setq r1 NIL)
            )
          )
          (if (and (> j 0) (< j (- tamanhoColuna 1)))
            (progn
              (if (= (aref tabuleiro (- i 1) (- j 1)) n)
                (setq r1 NIL)
              )
              (if (= (aref tabuleiro (- i 1) (+ j 1)) n)
                (setq r1 NIL)
              )
              (if (= (aref tabuleiro (+ i 1) (+ j 1)) n)
                (setq r1 NIL)
              )
              (if (= (aref tabuleiro (+ i 1) (- j 1)) n)
                (setq r1 NIL)
              )
            )
            (if (= j (- tamanhoColuna 1))
              (progn
                (if (= (aref tabuleiro (- i 1) (- j 1)) n):
                  (setq r1 NIL)
                )
                (if (= (aref tabuleiro (+ i 1) (- j 1)) n)
                  (setq r1 NIL)
                )
              )
            )
          )
        )
      )
      (if (= i (- tamanhoLinha 1))
        (progn
          (if (= j 0)
            (if (= (aref tabuleiro (- i 1) (+ j 1)) n)
              (setq r1 NIL)
            )
          )
          (if (and (> j 0) (< j (- tamanhoColuna 1)))
            (progn
              (if (= (aref tabuleiro (- i 1) (- j 1)) n)
                (setq r1 NIL)
              )
              (if (= (aref tabuleiro (- i 1) (+ j 1)) n)
                (setq r1 NIL)
              )
            )
          )
          (if (= j (- tamanhoColuna 1))
            (if (= (aref tabuleiro (- i 1) (- j 1)) n)
              (setq r1 NIL)
            )
          )
        )
      )
    )
  )
  r1
)

(defun possibilidade(i j n tamanhoLinha tamanhoColuna area)
  (setq r2 T)

  (if (eql (checarCasasOrtogonais i j n tamanhoLinha tamanhoColuna) NIL)
    (setq r2 NIL)
  )

  (if (eql (checarCasasDiagonais i j n tamanhoLinha tamanhoColuna) NIL)
    (setq r2 NIL)
  )

  (dotimes (m (length area))
    (setq tupla (nth m area))
    (setq k (nth 0 tupla))
    (setq l (nth 1 tupla))
    (if (= (aref tabuleiro k l) n)
      (progn
        (setq r2 NIL)
      )
    )
  )

  r2
)

(defun retornaLinha (matriz linha)
  (setq lista ())
  (dotimes (j (array-dimension matriz 1))
    (if (not (eql (aref matriz linha j) NIL))
      (setq lista (append lista (list (aref matriz linha j))))
    )
  )
  lista
)

(defun solucao()
  (dotimes (k (array-dimension regioes 0))
    (setq area (retornaLinha regioes k))
    (dotimes (l (length area))
      (setq tupla (nth l area))
      (setq i (nth 0 tupla))
      (setq j (nth 1 tupla))
      (if (= (aref tabuleiro i j) 0)
        (progn
          (loop for n from 1 to (length area)
            ; (+ (length area) 1)
            do
            (if (possibilidade i j n (array-dimension tabuleiro 0) (array-dimension tabuleiro 1) area)
              (progn
                (setf (aref tabuleiro i j) n)
                (solucao)
                (setf (aref tabuleiro i j) 0)
              )
            )
          )
          (return)
        )
      )
    )
  )
)

(defun main()
  (solucao)
  (write-line (write-to-string tabuleiro))
)

(main)
