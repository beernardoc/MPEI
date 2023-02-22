udata = load('u.data');
dic = readcell('users.txt', 'Delimiter', ';');

filmID = input('Insert Film ID (1 to 1682):', 's');
filmID = str2double(filmID);
while(isnan(filmID) || filmID < 1 || filmID > 1682)
    fprintf('Invalid Film ID, try again\n');
    filmID = input('Insert Film ID (1 to 1682):');
end
op = input('\n 1 - Users that evaluate current movie\n 2 - Suggestion of users to evaluate movie\n 3 - Suggestion of users to based on common interests\n 4 - Movies feedback based on popularity\n 5 - Exit\n Select choice:');
while(true)
    switch op
        case 1
            opcao1(udata, dic, filmID);
        case 2
            opcao2(udata, dic, filmID);
        case 3
            opcao3(udata, dic, filmID);
        case 4
            opcao4(udata, dic, filmID);
        case 5
            return;
        otherwise
            fprintf("Not a valid option, try again:\n");
    end
    op = input('\n 1 - Users that evaluate current movie\n 2 - Suggestion of users to evaluate movie\n 3 - Suggestion of users to based on common interests\n 4 - Movies feedback based on popularity\n 5 - Exit\n Select choice:');
end