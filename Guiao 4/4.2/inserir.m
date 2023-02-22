function B = inserir (B,elem,k)
  n = length(B);
  key=elem;
  
  for i=1 : k
    
    key=[key num2str(i)] ; 
    pos = string2hash(key);
    pos=mod(pos,n)+1;
    
    %fprintf(1,"key = %s -> pos = %d\n",elem,pos)
    B(pos)=1;
  end
end
