clear all;
close all;
w0 = 0.05*pi;
Nrea = 1;
N = 10000;
#generation du signal D(n) avec Nreal
for i=1:Nrea
   for n=1:N
     phi = 2*pi*rand;
    d(n) = sin(n * w0 + phi);
   end
   Dmat (i,:) = d;
   #Dmatrice la representation de plusiereurs realisations du signal d
end
 #moyenne de D(n)
  m = mean (Dmat);
 #variance de D(n)
  V = var(Dmat);
  #puissance de D(n)
  p = mean(Dmat.*Dmat);
 #generation de la moyenne empirique D(n)
 figure (1);
 hist(m,100);
 xlabel ('n');
 ylabel ('la moyenne de D(n)');
title('representaiton de la moyenne de D(n)');

#generation de la puissance moyenne instantanée de D(n)
 figure (2);
 hist(p,100);
 xlabel ('n');
 ylabel ('la moyenne de D(n)');
title('representaiton de la puissance de D(n)');

