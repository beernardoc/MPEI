%Gere aleatoriamente uma matriz de transic¸ao de estados para uma cadeia de 20 estados (identificados de ˜
%1 a 20) recorrendo a func¸ ` ao do Matlab ˜ rand. Com base nessa matriz:

T = zeros(20,20);

for k = 1 : 20
  r = rand(1, 20);
  r = r / sum(r);
  
  T(:,k) = r';
end

% a) Confirme que a matriz de transic¸ao de estados ˜ e estoc ´ astica
est = sum(sum(T)) % == 20 é estocastica

% b) Qual a probabilidade de o sistema, comec¸ando no estado 1, estar no estado 20 apos 2 transic¸ ´ oes? E ˜
%apos 5? E ap ´ os 10? E ap ´ os 100? Apresente os resultados em percentagem e com 5 casas decimais. ´
% O que conclui?

X = zeros(1,20)';
X(1) = 1; % estado inicial = 1

X2 = T^2 * X;
disp(X2(20,1))

X5 = T^5 * X;
disp(X5(20,1))

X10 = T^10 * X;
disp(X10(20,1))

X100 = T^100 * X;
disp(X100(20,1))

