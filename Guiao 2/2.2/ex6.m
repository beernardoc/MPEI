N = 1e5;
n = 8000; %amostra

p = 1/1000; %prob de defeito
k = 7; %defeitos


%a)Usando a distribuicao binomial

binomial = nchoosek(n,k)*(p^k)*((1-p)^(n-k));
binomial


%b)usando a aproximacao de Poisson 

lambda = n*p; %lambda nao é dado diretamente, faz-se n*p
pk = ((lambda^k)/factorial(k))*(exp(-lambda));
pk
