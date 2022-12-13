close all;
clear all;

w0 = 0.05*pi;
phi = 0;
sigmavCarre = 0.1;
N = 100;
P = 10;

%Ajout du bruit
d = zeros(1,N);
v = zeros(1,N);
x = zeros(1,N);

for n=1:N
    d(n)=sin(w0*n +phi);
    v(n)=sigmavCarre*randn;
    x(n)= d(n)+v(n);
end

%Recherche des coefficients de Wopt:
xP = x(1,1:P);
dP = d(1,1:P);
rdx = xcorr(dP,xP);
rdx = rdx(:,1:P);
rx = xcorr(xP);
rx = rx(:,1:P);

%Matrice d'autocorrélation Rx
Rx = toeplitz(rx);
Wopt = inv(Rx)*transpose(rdx);

%Sortie du filtre
xP = transpose(xP);
Xbuffer = zeros(P,1);
for i=1:N
    Xbuffer = [x(i);Xbuffer(1:P-1,:)];
    dchap(i) = transpose(Wopt)*Xbuffer;
end

%Courbes

%subplot(1,3,1);plot(d);%signal sans bruit
%subplot(1,3,2);plot(x);%signal avec bruit
%subplot(1,3,3);plot(dchap);%signal filtré 

%partie b)
%EQMin
rd = xcorr(dP);
EQMin = rd(1,1) - rdx*Wopt;
disp(EQMin)

%partie c)
%EQM en ligne
eqm = zeros(1,N);
for k=1:N
    eqm(k) = 0;
    for i =1:k
        eqm(k) = eqm(k) + (d(i) - dchap(i))^2;
    end
    eqm(k) = eqm(k)/k;
end

plot(eqm);
hold on;
plot([0 N],[EQMin,EQMin]);