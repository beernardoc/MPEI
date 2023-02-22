
N= 1e5; %num de repetições
p = 0.5; %probabilidade de cara
k = 6; %numero de caras/sucessos
n = 15; %numero de lancamentos
lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)<=k; % pelo menos k caras
probSimulacao = sum(sucessos)/N;



%b)
x = [0 1 2 3 4];
px = [prob0 prob1 prob2 prob3 prob4]