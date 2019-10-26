function vectorZ = thomas(matrizA, vectorB)
  tamanoA = size(matrizA);
  p = [];
  indiceP = 1;
  while (indiceP < tamanoA(1))
    if (indiceP == 1)
        p(indiceP) = matrizA(indiceP, 2) / matrizA(indiceP,1);
    else
      p(indiceP) = matrizA(indiceP, (indiceP + 1)) / (matrizA(indiceP, indiceP) - p(indiceP -1) * matrizA(indiceP, (indiceP - 1)));
   endif
   indiceP = indiceP + 1;
  endwhile
  q = [];
  indiceQ = 1;
  while (indiceQ <= tamanoA(1))
    if (indiceQ == 1)
      q(indiceQ) = vectorB(indiceQ,1) / matrizA(indiceQ,indiceQ);
    else
      q(indiceQ) = (vectorB(indiceQ,1) - q(indiceQ - 1) * matrizA(indiceQ, (indiceQ - 1))) / (matrizA(indiceQ, indiceQ) - p(indiceQ -1) * matrizA(indiceQ, (indiceQ - 1))); 
    endif
    indiceQ = indiceQ + 1;
  endwhile
  salida = [];
  indiceS = tamanoA;
  while (indiceS >= 1)
    if (indiceS == tamanoA(1))
      salida(indiceS, 1) = q(indiceS);
    else
      disp(p(indiceS));
      disp(salida((indiceS+1), 1));
      disp(p(indiceS) * salida((indiceS + 1), 1));
      
      #disp(salida((indiceS + 1), 1));
      salida(indiceS, 1) = q(indiceS) - p(indiceS) * salida((indiceS + 1), 1);
      disp(salida(indiceS,1));
    endif
    indiceS = indiceS - 1;
  endwhile
  
  disp(salida)
  disp(q)
  disp(p)


  
  
endfunction

  
#thomas([2.04,-1,0,0;-1,2.04,-1,0;0,-1,2.04,-1;0,0,-1,2.04], [40.8;0.8;0.8;200.8])