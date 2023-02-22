function p = generator(N,i_min,i_max,alphabet)
% geração de N patern aleatorio
% input : N - nº chaves
%output : p = 1/N
%o tamanho da palavra criada tem de ser entre i_min e i_max
if nargin < 4
    alphabet = ['a':'z' 'A':'Z' '0':'9'];   %numero argumentos inferior a 4
end
% obter comprimentos
comprimento =  randi([i_min, i_max],1,N);
p = cell(N,1);

for i=1:N
    pos = randi([1, length(alphabet)],1,comprimento(i));
    word = alphabet(pos);          %vai buscar as letras que estão nas posiçoes
                                     %dos numeros desse vetor
    %fprintf(1,'%2d - Comprimento: %3d Chave: %s\n',i,comprimento(i),word)

    %guardar em cell array
    p{i} = word;
end
end