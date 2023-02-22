% Considere o seguinte diagrama representativo de uma Cadeia de Markov:

% a) ) Defina, em Matlab, a matriz de transic¸ao de estados ˜ T assumindo p = 0, 4 e q = 0, 6.
p = 0.4;
q = 0.6;
T = [p^2,0,0,q^2 ; (1-p)^2,0,0,q*(1-q) ; p*(1-p),0,0,q*(1-q) ; p*(1-p),1,1,(1-q)^2]; %matriz transição



%% b) Assuma que o sistema se encontra inicialmente no estado A. Qual a probabilidade de estar em cada
%estado ao fim de 5 transic¸oes? E de 10 transic¸ ˜ oes? E de 100 transic¸ ˜ oes? E de 200 transic¸ ˜ oes?

T5 = T^5;
resp5 = T5(:,1)  

T10 = T^10;
resp10 = T10(:,1)

T100 = T^100;
resp100 = T100(:,1)


%% c) Determine as probabilidades limite de cada estado. Compare estes valores com os obtidos na al´ınea
% anterior. O que conclui?

%I = eye(length(T));
% u = Tu 

M =[T - eye(4) ; ones(1,4)]
M


x = [zeros(4,1) ; 1];
u = M\x;

disp("U: ")
disp(u)   % ~= resp100



