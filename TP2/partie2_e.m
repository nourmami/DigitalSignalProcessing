close all;
clear all;

w0 = 0.05*pi;
phi = 0;
sigmavCarre = 0.1;
N = 100;
%P = 10;

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
EQMinValues = zeros(1,10);
PValues = zeros(1,10);

j = 1;
for P = 5:5:50
    PValues(1,j) = P;
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

    %EQMin
    rd = xcorr(dP);
    EQMin = rd(1,1) - rdx*Wopt;
    EQMinValues(1,j) = EQMin;
    j=j+1;
end
plot(PValues,EQMinValues);

