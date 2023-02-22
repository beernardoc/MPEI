function J = calculate_distance(Nu,Set)

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
delete(h);
end

