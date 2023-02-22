function [] = opcao1(udata, dic, filmID)
    fprintf("\nRated the movie (%d):\n",filmID);
    for i=1:1:100000
        if(udata(i, 2) == filmID)
            user = (udata(i,1));
            
            fprintf("%d -> %s %s\n", user, string(dic(user,2)), string(dic(user, 3)));
        end
    end
end