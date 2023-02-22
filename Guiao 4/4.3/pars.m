function SimilarUsers = pars(J,Nu, users, threshold)

if nargin < 3
    threshold = 0.4;
end
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
end

