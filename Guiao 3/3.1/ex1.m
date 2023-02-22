T = [0.2,0.3;0.8,0.7]; %matriz transição
T
s = sum(T); %tem que ser 1


%% a)

V = [0 1]';  %vetor de estado f/nf  

v1 = T * V;  %vetor da prob da primeira aula

v2 = T * v1;  %vetor da prob da segunda aula
disp("A: ")
disp(v2(2,:)) %Se estiver presente na aula de quarta numa determinada semana, qual a probabilidade de estarpresente na aula de quarta da semana seguinte?


%% b)

V = [1 0]';  %vetor de estado f/nf (coloco 1 no campo indicado na questao)


v1 = T * V;  %vetor da prob da primeira aula

v2 = T * v1;  %vetor da prob da segunda aula
disp("B: ")
disp(v2(2,:))



%% c)
v1 = [0 1]';
%v =v1;
%for aula = 2:15*2

 %   v = T * v;


%end

v = T^29 * v1; %15 semanas com 2 aulas por semana, mas ja passou a 1 aula
disp("C: ")
disp(v)


%% d)
%estado inicial:
pNFaltar = 0.85;
v1 = [ 1-pNFaltar pNFaltar]';

naulas = 30;
prob = zeros(1,naulas);
prob(1) = v1(1); % assumindo que a probabilidade de estar presente na primeira aula e de 85%

v = v1;


for aula = 2:30

    v = T * v1;
    prob(aula) = v(1);

end

plot(prob,'o--')


