N= 1e6; %num de exp
l = 2; %lancamentos por exp
n = 6; %possibilidades dado

lancamentos = randi(n,l,N) ; %matriz de lançamentos     Ncolunas = exp ; Nlinhas = lancamentos

%A)
probA = sum(lancamentos) == 9; %soma as colunas e faz comparação com 9
valor9 = sum(probA)/N %faz a divisao da quantidade de somas = 9 pela quantidade de exp


%B)
lancamentos(2,:);
sucessos = 0;
for linha = 1:N
    if mod(sum(lancamentos(2,linha)),2) == 0
        sucessos = sucessos + 1;
    end
    
end
probPAR = sucessos/N






