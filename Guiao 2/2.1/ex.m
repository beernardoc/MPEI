% 1 C)
% prob condicional
% A = "outro filho rapaz"
% B = "um dos filhos rapaz"
% P[A/B] = P[A ∩ B]/P[B] = [casosfav(A ∩ B)/Nexp] / [casosfav(B)/Nexp] =
% [casosfav(A ∩ B)/ casosfav(B)] ]
% casosfav(A ∩ B) = 2M
% casosfav(B) = 1M


N= 10; %num de exp
p = 0.5; %probabilidade do sexo
k = 1; %numero de rapazes minimo
k2 = 2; 
n = 5; %numero de filhos

lancamentos = rand(n,N) > p; %matriz de lançamentos
lancamentos
prob1M= sum(sum(lancamentos)>=k)/N; %Sabendo que pelo menos um dos filhos e rapaz
prob2M = sum(sum(lancamentos)==k2)/N; %probabilidade de um dos outros (e apenas um) ser tambem rapaz



resultado = prob2M/prob1M;
resultado



