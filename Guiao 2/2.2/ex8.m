%Assumindo que o numero de erros tipogr ´ aficos numa p ´ agina de um livro tem uma distribuic¸ ´ ao de Poisson ˜
%com λ = 0.02, calcule a probabilidade de que exista no maximo 1 erro num livro de 100 p ´ aginas. ´
%Considere que o numero de erros em cada p ´ agina ´ e independente do n ´ umero de erros nas outras p ´ aginas

lambda = 0.02; %lambda para uma pagina
lambda = 0.02 * 100; %lambda para 100 paginas 
pk = 0;

for k = 0:1

    pk = pk + (lambda^k)/(factorial(k))*(exp(-lambda));


end

pk



