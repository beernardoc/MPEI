function [] = opcao3(udata, dic, filmID)

    nfd=100;  % número de funções de dispersão
    
   
    %%  para obter Conjuntos e ID de utilizadores
    [user,set_por_user] = createSet2("u.data");  %create do conjunto de filmes por user
    [filmes,set_por_filme] = createSet("u.data");%create do conjunto de users por filme


    %avaliou_atual = zeros(length(set_por_filme{filmID}),1)
    
    avaliou_atual(:,1) = set_por_filme{filmID}; %users que avaliaram o filme atual

    interesses = strings(length(avaliou_atual),17);
    interesses(:,1) = set_por_filme{filmID};
    
    
    for k = 1:length(user)
        %avaliou_atual(k) = id
        interesses(k,:) = dic(k,:);
        
    end

    interesses(:,2) = [];
    interesses(:,2) = [];  %fico apenas com os interesses e me baseio pelas linhas
    interesses(:,1) = [];

    %[filmes,set] = createSet(udata); 
    
    %% Calcular MinHash
    
    % inicializar as funções de dispersão
    N= 100000;
    v= inicFuncoesDispersao(N,nfd);
    
    % calcular Assinaturas usando MinHash
    
    signatures=calcularMatrizAssinaturas(interesses,v,N,nfd); %assinaturas baseadas nos interesses
    
    
    %% Calcular distâncias com base na matriz de assinaturas
    
    distancias=calcularDistancias(signatures,nfd);
    

    %% filtrar, para cada user que avaliou o filme atual, as distancias menores do que 0.9 e que ainda nao avaliaram o filme atual

    
    resultados = zeros(length(user),2);
    resultados(:,1) = user(:,1);

      for k = 1:length(avaliou_atual) % 1->452
           %avaliou_atual(k)
           
           if avaliou_atual(k) > length(distancias)/2 %da metade pro final
               
            linha = distancias(:,avaliou_atual(k)); %separa apenas a coluna do user atual, que avaliou o filme atual.

                  for m = 1:length(linha)
                    
                    if linha(m) < 0.9 && linha(m) > 0 %menor que o limiar, maior que 0 
                       if sum(ismember(set_por_filme{filmID},m)) == 0 %verifica se o user nao avaliou o filme atual
                        
                        resultados(m,2) = resultados(m,2) + 1;
                        
                       end
                    end
                  end

           end
           
           if avaliou_atual(k) < length(distancias)/2 %do inicio ate a metade

             linha = distancias(avaliou_atual(k),:); %separa apenas a coluna do user atual, que avaliou o filme atual

                for m = 1:length(linha)
                    
                    if linha(m) < 0.9 && linha(m) > 0 %menor que o limiar, maior que 0 e nao viu o filme
                       if sum(ismember(set_por_filme{filmID},m)) == 0
                       
                        resultados(m,2) = resultados(m,2) + 1;
                       
                       end
                    end


                end

           end


      end



      %% saida
    max = maxk(resultados(:,2),2);
    fprintf("\nPotential users for the film %d:\n",filmID);
    
    if max(1) == max(2)
        primeiro_segundo = find(resultados(:,2)==max(1));
        for i=1:2  %  
            fprintf('User: %d (%s %s) -> %d occurrences\n',primeiro_segundo(i) , char(dic(primeiro_segundo(i), 2)), char(dic(primeiro_segundo(i), 3)), max(1));
        end
    else
        for i=1:2  %
            fprintf('User: %d (%s %s) -> %d occurrences\n',find(resultados(:,2)==max(i)), char(dic(find(resultados(:,2)==max(i)), 2)), char(dic(find(resultados(:,2)==max(i)), 3)) ,max(i));
        end

    end



      
end