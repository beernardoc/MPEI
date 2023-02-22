% esse set faz o conjunto users por filme, 
% esse set faz o conjunto filmes por user
function [user,Set] = createSet2 (file)
  %udata=load(file); % Load File
  udata = load('u.data');


  u= udata(1:end,1:2); clear udata; %Get only 100 users

  % Users list
  user = unique(u(:,1)); % Get film IDs
  Nu= length(user);  % Total ammount of users

  % Make list of films per user
  Set= cell(Nu,1); 

  for n = 1:Nu % For each user
    % Get users films
    ind = find(u(:,1) == user(n));
    %And store in Set
    Set{n} = [Set{n} u(ind,2)];
  end
end
