function [] = opcao4(udata, dic, filmID)
    display("FUNÇÃO INCOMPLETA")
    filmName = input("Insert the name of the film (or part of it)\n", 's');
    %similares = zeros(1, 3);
    %sim1 = 0;
    %sim2 = 0;
    %sim3 = 0;
    h= waitbar(0,'Calculando...');
    %%%%
    dic2 = readcell('film_info.txt', 'Delimiter', '\t');
    names0 = char(dic2(:, 1));
    %names = zeros(1682, 1);
    for line=1:1:1682
        str0 = names0(line, :);
        index_last_int = regexp(str0, '\d+', 'end');
        str = str0(1:(index_last_int - 6));
        ind = sum(index_last_int) - 6;
        names_size(line, 1) = ind;
        names(line, 1:length(str)) = str;
    end
    %display(names(1, :))
    %display(names);
    shingles = cell(length(names), 1);
    for i = 1:length(names)
        shingles{i} = getShingles(names(i, :), 5, names_size(i));
    end

    count = 1;
    for i=1:1:length(shingles)
        for j=1:1:length(shingles{i})
            shingles2(count) = shingles{i}{j};
            count = count + 1;
        end
    end
    % ocorrencia de cada shingle
    [uniqueShingles, ~, shingleIdx] = unique(shingles2);
    shingleCounts = histc(shingleIdx, 1:numel(uniqueShingles));
    [maxCount, maxIdx] = max(shingleCounts);
    mostFrequentShingle = uniqueShingles{maxIdx};
    shingleCounts(maxIdx) = 0;
    [maxCount2, maxIdx2] = max(shingleCounts);
    mostFrequentShingle2 = uniqueShingles{maxIdx2};
    shingleCounts(maxIdx2) = 0;
    %display(mostFrequentShingle2)
    [maxCount3, maxIdx3] = max(shingleCounts);
    mostFrequentShingle3 = uniqueShingles{maxIdx3};
    shingleCounts(maxIdx3) = 0;
    %display(mostFrequentShingle3)
    [maxCount4, maxIdx4] = max(shingleCounts);
    mostFrequentShingle4 = uniqueShingles{maxIdx4};
    shingleCounts(maxIdx4) = 0;
    %display(mostFrequentShingle4)
    count = 1;
    for i=1:1:1682
        for j=1:1:(length(names(i, :))-5)
            if (names(i, j) == mostFrequentShingle2(1) && names(i, j+1) == mostFrequentShingle2(3) && names(i, j+2) == mostFrequentShingle2(5) && names(i, j+3) == mostFrequentShingle2(7) && names(i, j+4) == mostFrequentShingle2(9))
                lista(count) = names(i, :);
                count = count + 1;
            end
            if (names(i, j) == mostFrequentShingle3(1) && names(i, j+1) == mostFrequentShingle3(3) && names(i, j+2) == mostFrequentShingle3(5) && names(i, j+3) == mostFrequentShingle3(7) && names(i, j+4) == mostFrequentShingle3(9))
                lista(count) = names(i, :);
                count = count + 1;
            end
            if (names(i, j) == mostFrequentShingle4(1) && names(i, j+1) == mostFrequentShingle4(3) && names(i, j+2) == mostFrequentShingle4(5) && names(i, j+3) == mostFrequentShingle4(7) && names(i, j+4) == mostFrequentShingle4(9))
                lista(count) = names(i, :);
                count = count + 1;
            end
        end
    end
    
    %display(lista)
    fprintf("\nMost similar sequences:\n %s \n %s \n %s\n\n", mostFrequentShingle2, mostFrequentShingle3, mostFrequentShingle4);

    c = 1;
    for l=1:1:length(lista)
        for line = 1:1:1682
            if(strcmp(dic2(line, 1), mostFrequentShingle2) == true)
                id_lista(c) = line;
                c = c + 1;
            end
            if(strcmp(dic2(line, 1), mostFrequentShingle3) == true)
                id_lista = line;
                c = c + 1;
            end
            if(strcmp(dic2(line, 1), mostFrequentShingle4) == true)
                id_lista = line;
                c = c + 1;
            end
        end
    end

    countlista = zeros(length(id_lista));
    for i=1:1:100000
        if(ismember(udata(i, 2), id_lista) == true)
            if(udata(i, 3) >= 3)
                count_lista(find(id_lista)) = count_lista(find(id_lista)) + 1;
            end
        end
    end
    fprintf("Most similar titles (and number of times that each film was evaluated with 3 or +):\n")
    for l=1:1:length(lista)
        fprintf("%s -> %d\n", lista(l), count_lista(l));
    end




%% -----
    %hashes = zeros(length(shingles), length(shingles{1}));
    %for i = 1:length(shingles)
    %    for j = 1:length(shingles{i})
    %        hashes(i,j) = hash(shingles{i}{j});
    %    end
    %end
    %similarity = zeros(length(hashes));
    %for i = 1:length(hashes)
    %    for j = i:length(hashes)
    %        similarity(i,j) = minhash(hashes(i,:), hashes(j,:));
    %        similarity(j,i) = similarity(i,j);
    %    end
    %end
    %disp(similarity)
%% ---------
    %for f=1:1:1682
    %    similarity = string_similarity(dic2(f, 1), filmName, 5);
    %    if(similarity > sim3)
    %        if(similarity > sim2)
    %            if(similarity > sim1)
    %                sim1 = f;
    %            else
    %                sim2 = f;
    %            end
    %        else
    %            sim3 = f;
    %        end
    %    end
    %end
    %ev1 = 0;
    %ev2 = 0;
    %ev3 = 0;
    %for i=1:1:100000
    %    if((udata(i, 1) == sim1) && (udata(i, 3) >= 3))
    %        ev1 = ev1 + 1;
    %    elseif((udata(i, 1) == sim2) && (udata(i, 3) >= 3))
    %        ev2 = ev2 + 1;
    %    elseif((udata(i, 1) == sim3) && (udata(i, 3) >= 3))
    %        ev3 = ev3 + 1;
    %    end
    %end

    %delete(h);
    %printf("Most similar titles (and number of times that each film was evaluated with 3 or +):\n %s -> %d \n %s -> %d \n %s -> %d \n", dic2(sim1, 1), ev1, dic2(sim2, 1), ev2, dic2(sim3, 1), ev3);

    
end