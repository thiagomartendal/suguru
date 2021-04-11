; Matriz que representa o tabuleiro que deve ser solucionado
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

; Matriz de regiões onde cada linha representa uma região com tuplas
; que contém a posição de cada casa na matriz tabuleiro
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

; Método de verificação de casas ortogonais
; as casas ortogonais são casas que estão na vertical e na horizontal da casa atual
; são verificadas apenas as casas próximas, e não todas as casas da linha e da coluna
; cada if faz a comparação da casa atual com sua casa ortogonal adjacente
; uma casa ortogonal é uma casa que está na horizontal ou na vertical da casa atual
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

; Método de verificação das casas diagonais
; são checadas apenas as casas próximas da casa atual, e não uma diagonal inteira
; cada if faz a comparação da casa atual com sua casa adjacente a diagonal
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

; Método que determina se um número específico pode ocupar a casa atual
(defun possibilidade(i j n tamanhoLinha tamanhoColuna area)
  (setq r2 T)

  ; Aqui é checado se estu número existe em uma casa adjascente ortogonal (vertical ou horizontal)
  (if (eql (checarCasasOrtogonais i j n tamanhoLinha tamanhoColuna) NIL)
    (setq r2 NIL)
  )

  ; Aqui é checado se o número existe em uma casa adjascente diagonal
  (if (eql (checarCasasDiagonais i j n tamanhoLinha tamanhoColuna) NIL)
    (setq r2 NIL)
  )

  ; Neste laço de repetição ocorre a verificação da regial atual onde o número será adicionado
  ; caso o número já exista na região, ele é descartado
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

; Este método retorna uma linha da matriz de regiões
; uma linha representa uma região do tabuleiro
(defun retornaLinha (matriz linha)
  (setq lista ())
  (dotimes (j (array-dimension matriz 1))
    (if (not (eql (aref matriz linha j) NIL))
      (setq lista (append lista (list (aref matriz linha j))))
    )
  )
  lista
)

; O método de solução fica responsável por resolver o tabuleiro via backtracking
(defun solucao()
  (dotimes (k (array-dimension regioes 0)) ; Percorre a matriz de regiões
    (setq area (retornaLinha regioes k)) ; Retorna uma linha da matriz de regiões, que representa uma região do tabuleiro
    (dotimes (l (length area)) ; Percorre a região atual que está sendo preenchida
      (setq tupla (nth l area)) ; Retorna uma tupla da região para se trabalhar, onde cada tupla é uma casa
      (setq i (nth 0 tupla)) ; Coordenada 1 da casa
      (setq j (nth 1 tupla)) ; Coordenada 2 da casa
      (if (= (aref tabuleiro i j) 0) ; Checa se a casa no tabuleiro é igual a zero
        (progn
          (loop for n from 1 to (length area) ; Escolhe um número de 1 até o tamanho da área para se inserir no tabuleiro
            do
            (if (possibilidade i j n (array-dimension tabuleiro 0) (array-dimension tabuleiro 1) area) ; Checa se é possível adicionar o número a casa
              (progn
                (setf (aref tabuleiro i j) n) ; Escreve o número na casa do tabuleiro se este é aprovado
                (solucao) ; Inicia o backtracking
                (setf (aref tabuleiro i j) 0) ; Retorna o tabuleiro ao seu estado anterior para o backtracking ter efeito
              )
            )
          )
          (return) ; Quebra a sequencia de execuções
        )
      )
    )
  )
)

; Método main
(defun main()
  (solucao) ; Realiza a solução
  (write-line "Solução:")
  (write-line (write-to-string tabuleiro)) ; Exibe a solução final
)

(main) ; Executa o programa
