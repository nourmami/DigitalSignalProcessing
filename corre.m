clear all;
 close all;
w0 = 0.05 pi;
Nrea = 1;
N = 10000;
P = 5;
%cofficients de la matrice
 somme = 0;
 for i=1: Nrea
   for n=1:N
    phi = 2*pi*rand;
    d(n) = sin(n * w0 + phi);
   end
  Dmat(i,:) = d;
 end
Dcar = Dmat.*Dmat;
 for k=0: P-1
   for n=k+1:N
     somme =somme+ d(n)*d(n-k);
   end
  r(k+1)=somme/(N-k);

 end
disp(r);
X = xcorr(d,P-1);
#par methode de Xcorr
disp(x/(N-P+1));
m = mean(Dcar);
#par la moyenne empirique
hist (m,100);
