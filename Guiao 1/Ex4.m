N= 1e5; %num de repetições
n = 20; %numero de lancamentos


for k = 1:21
    p(k) = prob(k,n,0.5,N);  
    p(k)
    

end



stem(0:n,p);