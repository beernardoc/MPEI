H = [0 1/2 1/2 0 1/4 0;
    1 0 0 0 1/4 0;
    0 0 0 1 1/4 0;
    0 0 1/2 0 1/4 1;
    0 0 0 0 0 0;
    0 1/2 0 0 0 0;];

    


n = 6; %numero paginas
b = 0.85;

%% A) ITERATIVO

H2 = b*H + (1-b) * ones(n)/n;
x0 = ones(n,1)/n;

x=x0;
ep = 0.01;


iter = 1;
while 1
    xold=x;
    x=H2*x;

    if max(abs(x-xold)) == 0
        break;
    end
    iter = iter + 1;
    

end
disp(x)

%% B)

pr = ones(n,1)/n;

for i = 1:10
    pr = H*pr;

end
disp(pr)


