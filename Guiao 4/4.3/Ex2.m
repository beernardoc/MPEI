[Set, Nu, users] = read_data('u.data');

J = calculate_distance(Nu, Set);

SimilarUsers = pars(J, Nu, users, 0.4);
SimilarUsers