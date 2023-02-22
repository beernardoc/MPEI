function  [ doissimilares ] = dois_similares(distancias,id)
doissimilares = zeros(2,1);


if id > 841 %da metade pra frente compara pelas colunas
linha = distancias(:,id); 

else  %do inicio ate o meio compara pelas linhas
linha = distancias(id,:);
end


maiorquezero = mink(linha(linha>0),2); %seleciona as duas menores distancias > 0

if maiorquezero(1) == maiorquezero(2) %caso os dois filmes mais similares tenham a mesma distancia
  temp = find(linha==maiorquezero(1));
  doissimilares(1) = temp(1);
  doissimilares(2) = temp(2);


else

for k = 1:length(maiorquezero)
   doissimilares(k) = find(linha==maiorquezero(k),1);
end

end

fprintf(1,'\nThe two films most similar to this one (%d) are:\n',id);
for i=1:length(doissimilares)  %  
            fprintf('%3d  : Distance = %.3f\n', doissimilares(i),maiorquezero(i));
end






end




