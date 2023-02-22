function opcao2(udata, dic, filmID)   


    nfd=100;  % número de funções de dispersão
 

    %  para obter Conjuntos e ID de filmes
    [filmes,set] = createSet("u.data"); 

    
  
    %% Calcular MinHash

    % inicializar as funções de dispersão
    N= 100000;
    v= inicFuncoesDispersao(N,nfd);
    
    % calcular Assinaturas usando MinHash
    
    signatures=calcularMatrizAssinaturas(set,v,N,nfd);
    
    
    %% Calcular distâncias com base na matriz de assinaturas
    
    distancias=calcularDistancias(signatures,nfd);
    
    
    %% Determinar os dois Pares Similares com base na distância 
    
    doissimilares = dois_similares(distancias,filmID); % mostra os dois filmes mais similares ao filmID
    
    
    
    
    %% retorna uma tabela cm apenas os dois MAIS similares baseados na distancia
   
        count0 = 1;
        count1 = 1;
        count2 = 1;
        for a=1:1:100000
            if(udata(a, 2) == filmID)
                avaliou_atual(count0) = udata(a, 1);
                count0 = count0 + 1;
            end
            if(udata(a, 2) == doissimilares(1))
                avaliou_1(count1) = udata(a, 1);
                count1 = count1 + 1;
            end
            if(udata(a, 2) == doissimilares(2))
                avaliou_2(count2) = udata(a, 1);
                count2 = count2 + 1;
            end
        end

        count3 = 1;
        for b=1:1:length(avaliou_1)
            if(ismember(avaliou_1(b), avaliou_atual) == false)
                utilizadores(count3) = avaliou_1(b);
                count3 = count3 + 1;
            end
        end
        for c=1:1:length(avaliou_2)
            if((ismember(avaliou_2(c), avaliou_atual) == false) && (ismember(avaliou_2(c), utilizadores) == false))
                utilizadores(count3) = avaliou_2(c);
                count3 = count3 + 1;
            end
        end
        fprintf("\nSuggestion of users to evaluate movie:\n");
        for d=1:1:length(utilizadores)
            fprintf(" %d -> %s %s\n", utilizadores(d), strjoin(dic(utilizadores(d), 2), ' '), strjoin(dic(utilizadores(d), 3), ' ' ));
        end
    
 
end