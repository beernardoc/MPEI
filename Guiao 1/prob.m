function probSimulacao = prob(k,n,p,N)


lancamentos = rand(n,N) > p; %matriz de lançamentos
sucessos= sum(lancamentos)==k; 
probSimulacao = sum(sucessos)/N;

end