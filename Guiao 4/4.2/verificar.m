function r = verificar (B,elem,k)
  n = length(B);
  key=elem;
  r=true;
  
 for i=1 : k
    
    key=[key num2str(i)]  ;
    pos = string2hash(key);
    pos=mod(pos,n)+1;
    
  
    
    if B(pos)==0
      r=false;
      break
    end
    
 end
end