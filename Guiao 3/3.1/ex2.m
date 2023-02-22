% Considere a seguinte “danc¸a” de grupos: Divide-se uma turma em 3 grupos (A, B e C) no in´ıcio do
%semestre e no final de cada aula efectuam-se os seguintes movimentos:




% a) 


T = [1/3,1/4,0 ; 1/3,11/20,1/2 ; 1/3,1/5,1/2];
format rational
disp("A: ")
disp(T)



%% b) Crie o vector relativo ao estado inicial considerando que no total temos 90 alunos, o grupo A tem
%o dobro da soma dos outros dois e os grupos B e C tem o mesmo n ˆ umero de alunos.

total = 90; 
a = 60;
b = 15;
c = b;
v = [a b c]'/90;

format rational
disp("B: ")
disp(v);



%% C) Quantos elementos integrarao cada grupo no fim da aula 30 considerando como estado inicial o ˜
% definido na al´ınea anterior?
v30 = T^30 * v; 
format short
n = v30 * 90

%% D) Quantos elementos integrarao cada grupo no fim da aula 30 considerando que inicialmente se dis- ˜
% tribuiram os 90 alunos equitativamente pelos 3 grupos?

v = [1/3 1/3 1/3]'/90;
v30 = T^30 * v;
format short
n = v30 * 90


