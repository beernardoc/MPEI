N = 1e5;
media = 14;
dp = 2; % = sigma


x = randn(1,N)*dp + media;

% a)  um aluno do curso ter uma classificacao entre 12 e 16:
p = 0;

for i = 1:N
    if(x(i) > 12 && x(i) < 16)
        p = p+ 1;

    end

end

prob = p/N;
disp("uma classificacao entre 12 e 16: " + prob);


% b) os alunos terem classificacoes entre 10 e 18:
p = 0;

for i = 1:N
    if(x(i) > 10 && x(i) < 18)
        p = p + 1;

    end

end
prob = p/N;
disp("uma classificacao entre 10 e 18: " + prob);


% c) um aluno passar (ter classificac¸ao maior ou igual a 10):

p = 0;

for i = 1:N
    if(x(i) >= 10)
        p = p + 1;

    end

end
prob = p/N;
disp("um aluno passar: " + prob);



