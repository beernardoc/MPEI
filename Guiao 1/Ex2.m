
N= 1e5; %num de repetições
p = 0.5; %probabilidade de cara
k = 6; %numero de caras/sucessos
n = 15; %numero de lancamentos
lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)==k;
probSimulacao = sum(sucessos)/N;
