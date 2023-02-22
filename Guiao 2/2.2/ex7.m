%Suponha que o numero de mensagens que chega a um servidor de ´ email segue uma lei de Poisson com
%media de 15 (mensagens por segundo). Calcule a probabilidade de num intervalo de um segundo: 
lambda = 15; %lambda é dado como a média


%a) o servidor nao receber nenhuma mensagem; k = 0
k = 0;

pk = (lambda^k)/(factorial(k))*(exp(-lambda));
pk


pk = 0; %zerar


%b) o servidor receber mais de 10 mensagens; 1 - ∑pk(k=[1,10])

for k = 1:10

    pk = pk + (lambda^k)/(factorial(k))*(exp(-lambda));

end

pk = 1 - pk;
pk


