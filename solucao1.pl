:- use_module(library(clpfd)).

% Entrada do tabuleiro

suguru([[A1,A2,A3,B1,C1,C2,D1,D2],
        [A4,E2,E1,B2,C3,C4,D3,D4],
        [E4,E3,B4,B3,C5,H1,H2,D5],
        [E5,F1,F2,B5,G2,G1,H3,H4],
        [I5,I4,F3,F4,G3,J1,J2,H5],
        [K1,I3,I2,F5,G4,M1,J3,J4],
        [K2,K4,I1,L1,G5,M2,M3,J5],
        [K3,K5,L2,L3,L4,L5,M4,M5]]):-

  % Divisão das regiões

  As = [A1,A2,A3,A4],
  Bs = [B1,B2,B3,B4,B5],
  Cs = [C1,C2,C3,C4,C5],
  Ds = [D1,D2,D3,D4,D5],
  Es = [E1,E2,E3,E4,E5],
  Fs = [F1,F2,F3,F4,F5],
  Gs = [G1,G2,G3,G4,G5],
  Hs = [H1,H2,H3,H4,H5],
  Is = [I1,I2,I3,I4,I5],
  Js = [J1,J2,J3,J4,J5],
  Ks = [K1,K2,K3,K4,K5],
  Ls = [L1,L2,L3,L4,L5],
  Ms = [M1,M2,M3,M4,M5],

  % Preenchimento de valores numéricos para cada região

  As ins 1..4,
  Bs ins 1..5,
  Cs ins 1..5,
  Ds ins 1..5,
  Es ins 1..5,
  Fs ins 1..5,
  Gs ins 1..5,
  Hs ins 1..5,
  Is ins 1..5,
  Js ins 1..5,
  Ks ins 1..5,
  Ls ins 1..5,
  Ms ins 1..5,

  % Aplicação das regras da solução
  % O comando label demarca o preenchimento da região
  % O Comando all_distinct define que cada valor na região deve ser diferente
  % O uso de not member define a comparação de desigualdade de uma casa com seus vizinhos
  % Casas que fazem parte da mesma região não necessitam ser comparadas,
  % pois estas já foram distinguidas

  % Cada bloco de código define uma comparação para cada região

  label(As),
  all_distinct(As),

  label(Bs),
  all_distinct(Bs),
  not(member(B1,[A3])),
  not(member(B2,[A3])),

  label(Cs),
  all_distinct(Cs),
  not(member(C1,[B1,B2])),
  not(member(C3,[B1,B2,B3])),
  not(member(C5,[B2,B3])),

  label(Ds),
  all_distinct(Ds),
  not(member(D1,[C2,C4])),
  not(member(D3,[C2,C4])),

  label(Es),
  all_distinct(Es),
  not(member(E1,[A2,A3,B1,B2,B3,B4])),
  not(member(E2,[A1,A2,A3,A4,B4])),
  not(member(E3,[A4,B4])),
  not(member(E4,[A4])),

  label(Fs),
  all_distinct(Fs),
  not(member(F1,[B4,E3,E4,E5])),
  not(member(F2,[B3,B4,B5,E3])),
  not(member(F3,[B5])),
  not(member(F4,[B5])),

  label(Gs),
  all_distinct(Gs),
  not(member(G1,[C5])),
  not(member(G2,[B3,B5,C5,F4])),
  not(member(G3,[B5,F4,F5])),
  not(member(G4,[F4,F5])),
  not(member(G5,[F5])),
  not(member(B3,[C3,C5,F2,G2])),

  label(Hs),
  all_distinct(Hs),
  not(member(H1,[C3,C4,C5,D3,G1,G2])),
  not(member(H2,[C4,D3,D4,D5,G1])),
  not(member(H3,[D5,G1])),
  not(member(H4,[D5])),

  label(Is),
  all_distinct(Is),
  not(member(I1,[F5])),
  not(member(I2,[F3,F4,F5])),
  not(member(I3,[F3])),
  not(member(I4,[E5,F1,F2,F3])),
  not(member(I5,[E5,F1])),

  label(Js),
  all_distinct(Js),
  not(member(J1,[G1,G2,G3,G4,H3])),
  not(member(J2,[G1,H3,H4,H5])),
  not(member(J3,[H5])),
  not(member(J4,[H5])),

  label(Ks),
  all_distinct(Ks),
  not(member(K1,[I5,I4,I3])),
  not(member(K2,[I3])),
  not(member(K4,[I3,I2,I1])),
  not(member(K5,[I1])),

  label(Ls),
  all_distinct(Ls),
  not(member(L1,[F5,G4,G5,I1,I2])),
  not(member(L2,[I1,K4,K5])),
  not(member(L3,[G5,I1])),
  not(member(L4,[G5])),
  not(member(L5,[G5])),

  label(Ms),
  all_distinct(Ms),
  not(member(M1,[G3,G4,G5,J1,J2,J3])),
  not(member(M2,[G4,G5,J3,L4,L5])),
  not(member(M3,[J3,J4,J5,L5])),
  not(member(M4,[J5,L5])),
  not(member(M5,[J5])).

%------Consultas------

% suguru(Rows), maplist(label, Rows), maplist(portray_clause, Rows).

% Rows = [[_,_,_,3,_,_,2,_],[4,_,_,_,_,_,_,_],[_,2,_,_,_,_,_,_],[_,1,5,_,_,1,5,_],[_,2,_,_,_,_,_,_],[_,_,_,_,4,_,_,4],[_,_,_,_,_,3,_,_],[_,5,_,_,_,5,_,_]], suguru(Rows), maplist(label, Rows), maplist(portray_clause, Rows).
