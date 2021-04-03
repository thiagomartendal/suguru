import numpy as np
from copy import copy, deepcopy

tabuleiro = [[0,0,0,3,0,0,2,0],
             [4,0,0,0,0,0,0,0],
             [0,2,0,0,0,0,0,0],
             [0,1,5,0,0,1,5,0],
             [0,2,0,0,0,0,0,0],
             [0,0,0,0,4,0,0,4],
             [0,0,0,0,0,3,0,0],
             [0,5,0,0,0,5,0,0]]

regioes = [
    ([(0,0),(0,1),(0,2),(1,0)],[4]),
    ([(0,3),(1,3),(2,3),(2,2),(3,3)],[3]),
    ([(0,4),(0,5),(1,4),(1,5), (2,4)],[]),
    ([(0,6),(0,7),(1,6),(1,7),(2,7)],[2]),
    ([(1,1),(1,2),(2,1),(2,0),(3,0)],[2]),
    ([(3,1),(3,2),(4,2),(4,3),(5,3)],[1,5]),
    ([(3,4),(3,5),(4,4),(5,4),(6,4)],[1,4]),
    ([(2,5),(2,6),(3,6),(3,7),(4,7)],[5]),
    ([(4,0),(4,1),(5,1),(5,2),(6,2)],[2]),
    ([(4,5),(4,6),(5,6),(5,7),(6,7)],[4]),
    ([(5,0),(6,0),(6,1),(7,0),(7,1)],[5]),
    ([(7,2),(7,3),(6,3),(7,4),(7,5)],[5]),
    ([(5,5),(6,5),(6,6),(7,6),(7,7)],[3])
]

copiaRegioes = deepcopy(regioes) # Copia a matriz de regiões para uma variavél auxiliar, sem modificar a matriz original

def retornaArea(i, j, r):
    for t in r:
        p = t[0]
        for p1 in p:
            if (i == p1[0]) and (j == p1[1]):
                return t
    return None

def checarCasasOrtogonais(i, j, n, tamanhoLinha, tamanhoColuna):
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

def possibilidade(i, j, n, tamanhoLinha, tamanhoColuna):
    if checarCasasOrtogonais(i, j, n, tamanhoLinha, tamanhoColuna) is False:
        return False

    if checarCasasDiagonais(i, j, n, tamanhoLinha, tamanhoColuna) is False:
        return False

    return True

def solucao():
    global tabuleiro
    global copiaRegioes
    global regioes
    for i in range(len(tabuleiro)):
        for j in range(len(tabuleiro[i])):
            regiaoAtual = retornaArea(i, j, copiaRegioes)
            if tabuleiro[i][j] == 0:
                for n in range(len(regiaoAtual[0])+1):
                    if n not in regiaoAtual[1]:
                        if possibilidade(i, j, n, len(tabuleiro), len(tabuleiro[i])):
                            tabuleiro[i][j] = n
                            regiaoAtual[1].append(n)
                            solucao()
                            copiaRegioes = deepcopy(regioes)
                return

solucao()
