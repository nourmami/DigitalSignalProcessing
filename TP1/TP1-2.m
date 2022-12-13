clear all;
close all;
WO = 0.05*pi;
Nrea = {10,100,1000};
N = 10000;

%generation du signal D(n) avec Nreal {10,1000,10000}
for j=1:3
for i=1: Nrea{j}
   for n=1:N
     phi = (pi/4) * rand;
    d(n) = sin(n * WO + phi);
   end
  Dmat (i,:) = d;
  %Dmatrice la representation de plusiereurs realisations du signal d
end

%moyenne de D(n)
m = mean (Dmat);
figure (1);
histogram(m,'EdgeColor','auto');
hold on ;
xlabel ('n');
ylabel('moyenne ');
title ('generation de la moyenne du signal D(n) avec Nreal {10,1000,10000} ');
end


