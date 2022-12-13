clear all;
close all;
w0 = 0.05* pi;
N = 1000;
phi = 2*pi*rand(1,N);


   for n=1:N
    phi = 2*pi*rand;
    v = sin(n * w0 + phi);
    Vmat(n,:) = mean(v) ;
    eqm(n,;)=mean((Vmat-0).^2);
   end
  
 plot(Vmat, 'r');
 xlabel ('n');
 ylabel ('EQM error'); 
title('representaiton de lEQM error');