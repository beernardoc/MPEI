N = 1e5; %exp
n = 20; %dardos
m = 100; %alvos
experiencias = randi(m,n,N); %100 - numero de alvos ; n - numero dardos ; N - numero exp
%cada coluna é uma exp de 20 dados(linhas) lançados em 100 possiveis alvos


diferentes = zeros(1,N);


for col = 1:N
    diferentes(col) = length(unique(experiencias(:,col))) == n; %se a quantidade de valores unicos forem iguais a quantidade de dardos
    %^                condição booleana para ver se o tamanho é igual ao numero de dardos, caso verdadeiro = 1 
end


p1 = sum(diferentes)/N;
p2=1-p1;
fprintf('Alinea a): probabilidade = %.6f\n',p1);
fprintf('Alinea b): probabilidade = %.6f\n',p2);

