% esse set faz o conjunto users por filme
function [filme,Set] = createSet (file)
  udata=load(file); % Load File


  u= udata(1:end,1:2); clear udata; %Get only 100 users

  % Users list
  filme = unique(u(:,2)); % Get film IDs
  Nu= length(filme);  % Total ammount of users

  % Make list of films per user
  Set= cell(Nu,1); 

  for n = 1:Nu % For each user
    % Get users films
    ind = find(u(:,2) == filme(n));
    %And store in Set
    Set{n} = [Set{n} u(ind,1)];
  end
end
