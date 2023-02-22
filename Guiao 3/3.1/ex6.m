% a) Defina em Matlab a matriz de transic¸ao de estados ˜ T, com Tij sendo a probabilidade de ir do estado
% j para o estado i num unico passo. 


T = [0.8,0,0.3,0,0 ; 
    0.2,0.6,0.2,0,0; 
    0,0.1,0.4,0,0 ; 
    0,0.3,0,1,0 ; 
    0,0,0.1,0,1]


%% D) Determine a matriz Q.
 Q = T(1:3,1:3);  %T(1:numestadosnaoabsorventes, 1:numestadosnaoabsorventes) 

%% E) Determine a matriz fundamental F.

F = inv(eye(size(Q)) - Q);
F


%% F) Qual a media (valor esperado) do n ´ umero de passos antes da absorc¸ ´ ao comec¸ando no estado 1? E ˜
% comec¸ando no estado 2? E se comec¸ando no estado 4?
    disp("Qual a media (valor esperado) do numero de passos antes da absorcao comecando no estado 1")
    sum(F(:,1))
    disp("Qual a media (valor esperado) do numero de passos antes da absorcao comecando no estado 2")
    sum(F(:,2))
    disp("Qual a media (valor esperado) do numero de passos antes da absorcao comecando no estado 4")
    sum(F(:,3))


%% G) Comec¸ando no estado 1, qual e a probabilidade de absorc¸ ´ ao do estado 3? E do estado 5? Verifique ˜
%a coerencia destes valores com o que observou na al ˆ ´ınea 6 (c).
estadosNaoAbsorv = 3; % (1,2,4)
 R = T(estadosNaoAbsorv + 1:end,1:estadosNaoAbsorv);
 % R = T(3+1:,1:3)

 B = R * F;

 disp("qual e a probabilidade de absorcao do estado 3?")
 disp(B(1,1));
 disp("qual e a probabilidade de absorcao do estado 5?")
 disp(B(2,1));




