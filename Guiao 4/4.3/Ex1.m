udata=load('u.data'); % Carrega o ficheiro dos dados dos filmes
% Fica apenas com as duas primeiras colunas

u = udata(1:end,1:2); clear udata;
tic;
% Lista de utilizadores
users = unique(u(:,1)); % Extrai os IDs dos utilizadores
Nu= length(users); % N ́umero de utilizadores

% Constr ́oi a lista de filmes para cada utilizador
Set= cell(Nu,1); % Usa c ́elulas
for n = 1:Nu % Para cada utilizador
    % Obt ́em os filmes de cada um
    ind = find(u(:,1) == users(n));
    % E guarda num array. Usa c ́elulas porque utilizador tem um n ́umero
    % diferente de filmes. Se fossem iguais podia ser um array
    Set{n} = [Set{n} u(ind,2)]
end
fprintf("time to get movies_ %7.6es\n",toc);

tic;    
J=zeros(Nu, Nu); % array para guardar distˆancias
h= waitbar(0,'Calculating');
for n1= 1:Nu
    waitbar(n1/Nu,h);
    for n2= n1+1:Nu
        %% Adicionar c ́odigo aqui
        u1 = Set{n1,:};
        u2 = Set{n2,:};

        % calc da distancia de jacar --> formula
        nI = length(intersect(u1,u2));
        nU = length(union(u1,u2));

        dJ = 1 - nI/nU;
        J(n1,n2) = dJ;
    end
end
delete (h)
save("distances.mat", "J");
fprintf("time to calculate distances: %7.6es\n",toc);
%% Com base na distˆancia, determina pares com
%% distˆancia inferior a um limiar pr ́e-definido
tic;
threshold = 0.4; % limiar de decis ̃ao
h = waitbar(0,"Filtering...");
% Array para guardar pares similares (user1, user2, distˆancia)
SimilarUsers= zeros(1,3);
k= 1;
for n1= 1:Nu
    for n2= n1+1:Nu
        distancia = J(n1,n2);
        if distancia < threshold
            SimilarUsers(k,:) = [users(n1) users(n2) J(n1,n2)];
            k= k+1;
        end
    end
end
delete (h);
fprintf("time to filter similar: %7.6es\n",toc);

fprintf("Similar users (%d pairs):\n",height(SimilarUsers));
for n=1:height(SimilarUsers)
    u1 = SimilarUsers(n,1);
    u2 = SimilarUsers(n,2);
    d=J(u1,u2);
    fprintf("Pair (%d;%d): %f\n",u1,u2,d);
end