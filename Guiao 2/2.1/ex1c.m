% 1 C)
% prob condicional
% A = "outro filho rapaz"
% B = "um dos filhos rapaz"
% P[A/B] = P[A ∩ B]/P[B] = [casosfav(A ∩ B)/Nexp] / [casosfav(B)/Nexp] =
% [casosfav(A ∩ B)/ casosfav(B)] ]
% casosfav(A ∩ B) = 2M
% casosfav(B) = 1M


N= 1e6; %num de exp
p = 0.5; %probabilidade do sexo
k = 1; %numero de rapazes minimo
k2 = 2; 
n = 2; %numero de filhos

lancamentos = rand(n,N) > p; %matriz de lançamentos
prob2M = sum(sum(lancamentos)>=k2)/N; %probabilidade de ser 2M ( casosfav/Nexp)
probM= sum(sum(lancamentos)>=k)/N; %probabilidade de ser M ( casosfav/Nexp)


resultado = prob2M/probM;
resultado



