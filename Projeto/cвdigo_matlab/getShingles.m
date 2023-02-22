function shingles = getShingles(str, n, names_size)
    %words = strsplit(str(1, :));
    shingles = {};
    num = sum(isspace(str));
    str = regexprep(str, " ", "");
    names_size = names_size - num;
    if(names_size < 73)
        words = str(1:names_size);
    else
        words = str(1:73);
    end
    for i = 1:length(words)-n+1
        shingle = "";
        for j = 1:n
            if ~isempty(words(1, i+j-1))
                shingle = shingle + words(1, i+j-1);
                if j < n 
                    shingle = shingle + " ";
                end
            end
        end
        if ~isempty(shingle)
            shingles{end+1} = shingle;
            
        end
    end
    
end
