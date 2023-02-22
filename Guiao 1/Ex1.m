matriz = [1,2,3;5,6,7;9,8,4];
matriz
matriz(2,2) = 20;
matriz

%a)
N = 10000;
experiencias = rand(3,N);
lancamentos = experiencias > 0.5; %comparar cada lançamento com 0.5, se maior = 1
resultados = sum(lancamentos);  %soma as colunas da matriz(lancamentos) de 0s e 1s
sucessos = resultados == 2; %onde deram 2 caras cria-se um vetor com 0 e 1
Prob = sum(sucessos)/N;
experiencias






