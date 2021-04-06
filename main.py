import numpy as np

# Da biblioteca numpy é apenas usado np.matrix
# para imprimir a matriz formatada

tabuleiro = [[0,0,0,3,0,0,2,0],
        [4,0,0,0,0,0,0,0],
        [0,2,0,0,0,0,0,0],
        [0,1,5,0,0,1,5,0],
        [0,2,0,0,0,0,0,0],
        [0,0,0,0,4,0,0,4],
        [0,0,0,0,0,3,0,0],
        [0,5,0,0,0,5,0,0]]

regioes = [
    [(0,0),(0,1),(0,2),(1,0)],
    [(0,3),(1,3),(2,3),(2,2),(3,3)],
    [(0,4),(0,5),(1,4),(1,5), (2,4)],
    [(0,6),(0,7),(1,6),(1,7),(2,7)],
    [(1,1),(1,2),(2,1),(2,0),(3,0)],
    [(3,1),(3,2),(4,2),(4,3),(5,3)],
    [(3,4),(3,5),(4,4),(5,4),(6,4)],
    [(2,5),(2,6),(3,6),(3,7),(4,7)],
    [(4,0),(4,1),(5,1),(5,2),(6,2)],
    [(4,5),(4,6),(5,6),(5,7),(6,7)],
    [(5,0),(6,0),(6,1),(7,0),(7,1)],
    [(7,2),(7,3),(6,3),(7,4),(7,5)],
    [(5,5),(6,5),(6,6),(7,6),(7,7)]
]

def checarCasasOrtogonais(i, j, n, tamanhoLinha, tamanhoColuna):
    global tabuleiro
    if i == 0:
        if j == 0:
            if tabuleiro[i][j+1] == n:
                return False
            if tabuleiro[i+1][j] == n:
                return False
        elif (j > 0) and (j < (tamanhoColuna-1)):
            if tabuleiro[i][j-1] == n:
                return False
            if tabuleiro[i][j+1] == n:
                return False
            if tabuleiro[i+1][j] == n:
                return False
        elif j == (tamanhoColuna-1):
            if tabuleiro[i][j-1] == n:
                return False
            if tabuleiro[i-1][j] == n:
                return False
    elif (i > 0) and (i < (tamanhoLinha-1)):
        if j == 0:
            if tabuleiro[i-1][j] == n:
                return False
            if tabuleiro[i][j+1] == n:
                return False
            if tabuleiro[i+1][j] == n:
                return False
        elif (j > 0) and (j < (tamanhoColuna-1)):
            if tabuleiro[i][j-1] == n:
                return False
            if tabuleiro[i-1][j] == n:
                return False
            if tabuleiro[i][j+1] == n:
                return False
            if tabuleiro[i+1][j] == n:
                return False
        elif j == (tamanhoColuna-1):
            if tabuleiro[i][j-1] == n:
                return False
            if tabuleiro[i-1][j] == n:
                return False
            if tabuleiro[i+1][j] == n:
                return False
    elif i == (tamanhoLinha-1):
        if j == 0:
            if tabuleiro[i-1][j] == n:
                return False
            if tabuleiro[i][j+1] == n:
                return False
        elif (j > 0) and (j < (tamanhoColuna-1)):
            if tabuleiro[i][j-1] == n:
                return False
            if tabuleiro[i-1][j] == n:
                return False
            if tabuleiro[i][j+1] == n:
                return False
        elif j == (tamanhoColuna-1):
            if tabuleiro[i][j-1] == n:
                return False
            if tabuleiro[i-1][j] == n:
                return False
    return True

def checarCasasDiagonais(i, j, n, tamanhoLinha, tamanhoColuna):
    global tabuleiro
    if i == 0:
        if j == 0:
            if tabuleiro[i+1][j+1] == n:
                return False
        elif (j > 0) and (j < (tamanhoColuna-1)):
            if tabuleiro[i+1][j-1] == n:
                return False
            if tabuleiro[i+1][j+1] == n:
                return False
        elif j == (tamanhoColuna-1):
            if tabuleiro[i+1][j-1] == n:
                return False
    elif (i > 0) and (i < (tamanhoLinha-1)):
        if j == 0:
            if tabuleiro[i-1][j+1] == n:
                return False
            if tabuleiro[i+1][j+1] == n:
                return False
        elif (j > 0) and (j < (tamanhoColuna-1)):
            if tabuleiro[i-1][j-1] == n:
                return False
            if tabuleiro[i-1][j+1] == n:
                return False
            if tabuleiro[i+1][j+1] == n:
                return False
            if tabuleiro[i+1][j-1] == n:
                return False
        elif j == (tamanhoColuna-1):
            if tabuleiro[i-1][j-1] == n:
                return False
            if tabuleiro[i+1][j-1] == n:
                return False
    elif i == (tamanhoLinha-1):
        if j == 0:
            if tabuleiro[i-1][j+1] == n:
                return False
        elif (j > 0) and (j < (tamanhoColuna-1)):
            if tabuleiro[i-1][j-1] == n:
                return False
            if tabuleiro[i-1][j+1] == n:
                return False
        elif j == (tamanhoColuna-1):
            if tabuleiro[i-1][j-1] == n:
                return False
    return True

def possibilidade(i, j, n, tamanhoLinha, tamanhoColuna, area):
    if checarCasasOrtogonais(i, j, n, tamanhoLinha, tamanhoColuna) is False:
        return False

    if checarCasasDiagonais(i, j, n, tamanhoLinha, tamanhoColuna) is False:
        return False

    for tupla in area:
        if tabuleiro[tupla[0]][tupla[1]] == n:
            return False

    return True

def solucao():
    global tabuleiro
    global regioes
    for area in regioes:
        for tupla in area:
            i = tupla[0]
            j = tupla[1]
            if tabuleiro[i][j] == 0:
                for n in range(1, len(area)+1):
                    if possibilidade(i, j, n, len(tabuleiro), len(tabuleiro[tupla[0]]), area):
                        tabuleiro[i][j] = n
                        solucao()
                        tabuleiro[i][j] = 0
                return
    print("Solução:")
    print(np.matrix(tabuleiro))

solucao()
