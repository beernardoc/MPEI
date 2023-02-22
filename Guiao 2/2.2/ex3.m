
N= 1e5; %num de repetições
p = 0.5; %probabilidade de cara
n = 4; %numero de lancamentos

lancamentos = rand(n,N) > p;

sucessos0 = sum(lancamentos) == 0; %quando sum == 0 -> sucessos = 1
prob0 = sum(sucessos0)/N

sucessos1 = sum(lancamentos) == 1; %quando sum == 1 -> sucessos = 1
prob1 = sum(sucessos1)/N

sucessos2 = sum(lancamentos) == 2; %quando sum == 2 -> sucessos = 1
prob2 = sum(sucessos2)/N

sucessos3 = sum(lancamentos) == 3; %quando sum == 3 -> sucessos = 1
prob3 = sum(sucessos3)/N

sucessos4 = sum(lancamentos) == 4; %quando sum == 4 -> sucessos = 1
prob4 = sum(sucessos4)/N




%b)
x = [0 1 2 3 4];
px = [prob0 prob1 prob2 prob3 prob4] %probabilidades
media = sum(x.*px)
variancia = sum((x.^2).*px) - media^2
desvio = sqrt(variancia)

%c) Distribuição Binomial com p= 0.5 e n=4

%f)

sucessos2coroas = sum(lancamentos)>= 2;
prob2c = sum(sucessos2coroas)/N


