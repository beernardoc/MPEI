N = 1e5;


progA = rand(20,N) < 0.01; %andre tem 20 programas e 0.01 chance de erro

progB = rand(30,N) < 0.05; %Bruno tem 30 programas e 0.05 de chance de erro

progC = rand(50,N) < 0.001; %Carlos tem 50 programas e 0.001 chance de erro


programas = [progA;progB;progC]; %junta as matrizes dos 3

erroAndre = sum(sum(progA));%calcula o erro so da matriz do andre
erroBruno = sum(sum(progB));%calcula o erro so da matriz do bruno
erroCarlos = sum(sum(progC)); %calcula o erro so da matriz do carlos

erroTotal = sum(sum(programas)); %calcula o erro dos 3

probabilidadeErroAndre = erroAndre/erroTotal
probabilidadeErroBruno = erroBruno/erroTotal
probabilidadeErroCarlos = erroCarlos/erroTotal %erroc/erro total = probabilidade

