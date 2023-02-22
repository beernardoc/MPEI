% Considere que o tempo em cada dia e genericamente classificado num de 3 estados – sol, nuvens e chuva ´
%– e que o tempo num determinado dia apenas depende do tempo no dia anterior. Assuma que estamos
% no primeiro dia de janeiro e que as probabilidades de transic¸ao de estados s ˜ ao as da tabela seguinte. 


% a) Defina, em Matlab, a correspondente matriz de transic¸ao.

T = [0.7,0.2,0.1 ; 0.2,0.3,0.5 ; 0.3,0.3,0.4]'; %transposta pois no exercicio a origem esta nas colunas


%% b) Qual a probabilidade de estar sol no segundo dia e no terceiro dia de janeiro quando o primeiro dia e de sol? 


% dia 1 = sol

% p[ dia 1 = sol ] e p[dia 2 = sol / dia 1 = sol] e p[dia 3 = sol / dia 2 = sol]

v = [1;0;0]; %garanto que o primeiro dia é sol
v2 = T * v;
v3 = T * v2;
p = v2(1)*v3(1)


%% c)  Qual a probabilidade de nao chover nem no segundo dia nem no terceiro dia de janeiro quando o primeiro dia e de sol

v = [1;0;0]; %garanto que o primeiro dia é sol
v2 = T * v;
v3 = T * v2;
p = (v2(1) + v2(2)) * (v3(1) + v3(2)) 

%% d) Assumindo que o primeiro dia e de sol, determine o n ´ umero m ´ edio de dias de sol, de nuvens e de ´
% chuva que se espera ter em todo o mes de janeiro.

v = [1;0;0]

respSol = 1;
respNuvens = 0;
respChuva = 0;

for i = 2:31
    v = T * v;
    respSol = respSol + v(1);
    respNuvens = respNuvens + v(2);
    respChuva = respChuva+v(3);

end

respSol
respNuvens
respChuva

%% e) Assumindo que o primeiro dia e de chuva, determine o n ´ umero m ´ edio de dias de sol, de nuvens e ´
% de chuva que se espera ter em todo o mes de janeiro. Compare estes resultados com os da al ˆ ´ınea
% anterior. O que conclui?

v = [0;0;1];

respSol = 0;
respNuvens = 0;
respChuva = 1;

for i = 2:31
    v = T * v;
    respSol = respSol + v(1);
    respNuvens = respNuvens + v(2);
    respChuva = respChuva+v(3);

end

respSol
respNuvens
respChuva
    