% Considere o conjunto de paginas Web e respetivas hyperligac¸ ´ oes entre si dado pelo diagrama seguinte:

H = [0 0 0 0 1/3 0;
    1 0 0 0 1/3 0;
    0 1/2 0 1 0 0;
    0 0 1 0 0 0;
    0 1/2 0 0 0 0;
    0 0 0 0 1/3 0;];

%% A) ) Usando a matriz H das hyperligac¸oes, obtenha a estimativa do pagerank de cada p ˜ agina ao fim de ´
%10 iterac¸oes. Relembre que deve considerar (i) a mesma probabilidade de transic¸ ˜ ao de cada p ˜ agina ´
%para todas as paginas seguintes poss ´ ´ıveis e (ii) a probabilidade da pagina inicial deve ser igual para ´
% todas as paginas. Qual/quais a(s) p ´ agina(s) com maior pagerank e qual o seu valor ´


N =6 %NUMERO PAGIANS

pr = ones(6,1)/6;


for n = 1:10

    pr = H*pr;

end

pr  %paginas mais importas = maiores valores


%% B)

%spider trap = C e D ; caso eu entre em uma dessas casas eu nao saio mais do ciclo
% dead-end = F ; beco sem saida

%% C)  Altere a matriz H para resolver apenas o problema do ”dead-end”e recalcule o pagerank de cada
% pagina novamente em 10 iterac¸ ´ oes. 
b = 0.98;
A = b*H + (1-b)


pr = ones(6,1)/6;

for n = 1:10
    pr = A*pr;
end
%% D) Resolva agora ambos os problemas e recalcule o pagerank de cada pagina novamente em 10 ´
% iterac¸oes (assuma ˜ β = 0, 8)
b = 0.8;

H2 = b*H + (1-b) * ones(N)/N;

pr = ones(N,1)/N;

for n = 1:1000
    pr = H2*pr;
end
pr




