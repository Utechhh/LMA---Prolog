% Regras Do problema.
% Sendo: U = uniforme, E = equipe, C = capitão, S = strikes
% I = idade e P = pontuação.

main :-
    statistics(cputime,T1),
   campeonatoboliche(L1),
    mostralista(L1),

    statistics(cputime, T2),
    Tempo_BUSCA is (T2 - T1),
    format('\n T1: ~f \t T2: ~f  msec', [T1, T2]),
    format('\n Tempo total: ~10f  msec', Tempo_BUSCA).

mostralista([]).
mostralista([H|T]) :-
	write(H), nl,
	mostralista(T).



campeonatoboliche([ (U1,E1,C1,S1,I1,P1),
					(U2,E2,C2,S2,I2,P2),
					(U3,E3,C3,S3,I3,P3),
					(U4,E4,C4,S4,I4,P4),
					(U5,E5,C5,S5,I5,P5) ]) :-


    uniforme(U1),
    uniforme(U2),
    uniforme(U3),
    uniforme(U4),
    uniforme(U5),

    todosdiferentes([U1,U2,U3,U4,U5]),

%¨regra envolvendo uniforme, sao todos diferentes.
%As equipes verde e azul estão lado a lado.

(
(U1 == verde , U2 == azul);
(U2 == verde , (U3 == azul; U1 == azul));
(U3 == verde , (U2 == azul; U4 == azul));
(U4 == verde, (U3 == azul; U5 == azul));
(U5 == verde, U4 == azul)
),

%

%Regras envolvendo uniforme: A equipe Vermelha está em algum lugar entre a equipe doh capitão mais velho e a equipe com mais Strikes, nessa ordem.

%%%% S
strikes(S1),
strikes(S2),
strikes(S3),
strikes(S4),
strikes(S5),

tudodiferente([S1,S2,S3,S4,S5]),

idade(I1),
idade(I2),
idade(I3),
idade(I4),
idade(I5),

tudodiferente([I1,I2,I3,I4,I5]),

    I3 == 25,
    
(
(U2 == vermelho,I1 == 27,S3 == 4);
(U3 == vermelho,I2 == 27,S4 == 4);
(U4 == vermelho,I3 == 27,S5 == 4)
),

%%% A equipe com 390 pontos está exatamente à esquerda da equipe Azul.

%% P

	  pontos(P1),
      pontos(P2),
      pontos(P3),
      pontos(P4),
      pontos(P5),
      
		tudodiferente([P1,P2,P3,P4,P5]),
		
		    %A equipe com 4 strikes está exatamente à esquerda da que tem 380 pontos

    (
    (S1==4,P2==380);
    (S2==4,P3==380);
    (S3==4,P4==380);
    (S4==4,P5==380)
    ),
      
(
(P1=390, U2==azul);
(P2=390, U3==azul);
(P3=390, U4==azul);
(P4=390, U5==azul)
),

% O capitão mais novo está na equipe de uniforme Vermelho.
%%% C

capitao(C1),
capitao(C2),
capitao(C3),
capitao(C4),
capitao(C5),

tudodiferente([C1,C2,C3,C4,C5]),

(
(U1 == vermelho,C1 == 23);
(U2 == vermelho,C2 == 23);
(U3 == vermelho,C3 == 23);
(U4 == vermelho,C4 == 23);
(U5 == vermelho,C5 == 23)
),

%A equipe de Branco está exatamente à esquerda da equipe de Verde.

(
(U1 == branco,U2 == verde);
(U2 == branco,U3 == verde);
(U3 == branco,U4 == verde);
(U4 == branco,U5 == verde)
),



equipe(E1),
equipe(E2),
equipe(E3),
equipe(E4),
equipe(E5),
tudodiferente([E1,E2,E3,E4,E5]),

% Regras envolvendo equipes:
%
% A equipe Fenix está ao lado da equipe que fez 3 strikes.

    (
    (E1 == fenix, S2 == 3);
    (E2 == fenix, (S3 == 3; S1 == 3));
    (E3 == fenix,(S4 == 3; S2 == 3));
    (E4 == fenix, (S5 == 3;S3 == 3));
    (E5 == fenix,(S4 == 3))
    ),

%Os Peraltas ainda não fizeram Strike.

    (
    (E1 == peraltas, S1 == 0);
    (E2 == peraltas, S2 == 0);
    (E3 == peraltas, S3 == 0);
    (E4 == peraltas, S4 == 0);
    (E5 == peraltas, s5 == 0)
    ),

%Márcio é o capitão da equipe Fenix.

    (
    (E1 == fenix, C1 == marcio);
    (E2 == fenix, C2 == marcio);
    (E3 == fenix, C3 == marcio);
    (E4 == fenix, C4 == marcio);
    (E5 == fenix, C5 == marcio)
    ),

%Os Tratores estão ao lado da equipe que fez 2 strikes.

    (
    (E1 == tratores, S2 == 2);
    (E2 == tratores,(S1 == 2; S3 == 2));
    (E3 == tratores,(S2 == 2; S4 == 2));
    (E4 == tratores, (S3 == 2; S5 == 2));
    (E5 == tratores, S5 == 2)
     ),

% A equipe com 1 strike está a esquerda da 14 biz.

     (
     (E2 == quatorzebiz, S1 == 1);
     (E3 == quatorzebiz, S2 == 1);
     (E4 == quatorzebiz, S3 == 1);
     (E5 == quatorzebiz, S4 == 1)
     ),


     

      


 % Regras envolvendo capitão

% A equipe de carlos está na quinta posição.


      C5 == carlos,



%A equipe do Juliano está exatamente à direita da equipe do Oscar

 ((C1 == oscar , C2 == juliano);
 (C2 ==  oscar , C3 == juliano);
 (C3 == oscar , C4 == juliano);
 (C4 ==  oscar , C5 == juliano)),

 % Oscar está na equipe de 400 pontos.


      ((C1 == oscar, P1 == 400);
      (C2 ==  oscar, P2 == 400);
      (C3 ==  oscar, P3 == 400);
      (C4 ==  oscar, P4 == 400);
      (C5 ==  oscar, P5 == 400)),

 % Oscar está exatamente á direita da equipe que tem o capitao mais novo.

      ((C2 = oscar, I1 == 23);
      (C3 = oscar, I2 == 23);
      (C4 = oscar, I3 == 23);
      (C5 = oscar, I4 == 23)),





 
 


 % Regras envolvendo pontos

       % A equipe com 390 pontos está exatamente à direita da equipe que fez 3 strikes.



       ((S1 ==  3, P2 == 390);
       (S2 ==  3, P3 == 390);
       (S3 ==  3, P4 == 390);
       (S4 ==  3, P5 == 390)),


       %A equipe que fez 1 strike está ao lado da equipe que tem 400 pontos.

       ((S1 == 1, P2 == 400);
       (S2 == 1,(P3 == 400;P1 == 400));
       (S3 == 1, (P4 == 400; P2 == 400));
       (S4 == 1, (P5 == 400; P3 == 400));
       (S5 == 1, P4 == 400)),



       % Na segunda posição está a equipe com 410 pontos.

       P2 == 410,

       %O capitão de 26 anos está na equipe que tem 390 ponto

       (
       ( I1 == 26, P1 == 390);
       (I2 == 26, P2 == 390);
       (I3 == 26, P3 == 390);
       (I4 == 26, P4 == 390);
       (I5 == 26, P5 == 390)
       ),
       
       nl,
       writeln('.........................').

campeonatoboliche(_) :- writeln('...............REVISE AS ANTERIORES ').


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
uniforme(amarelo).
uniforme(azul).
uniforme(branco).
uniforme(verde).
uniforme(vermelho).

	equipe(quatorzebiz).
	equipe(fenix).
	equipe(peraltas).
	equipe(supinos).
	equipe(tratores).

capitao(arthur).
capitao(carlos).
capitao(juliano).
capitao(marcio).
capitao(oscar).

	strikes(0).
	strikes(1).
	strikes(2).
	strikes(3).
	strikes(4).

idade(23).
idade(24).
idade(25).
idade(26).
idade(27).

	pontos(380).
	pontos(390).
	pontos(400).
	pontos(410).
	pontos(420).

tudodiferente([]).
tudodiferente([H|T]) :-
	not(member(H,T)),
	tudodiferente(T).

