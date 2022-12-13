close all;
clear all;

w0 = 0.05*pi;
phi = 0;
sigmavCarre = 1;
N = 1000;

[dt,Fs] = audioread('C:\sample.wav');
d = transpose(dt);

sigmav = sqrt(sigmavCarre);
for n=1:N
    v(n)=sigmavCarre*randn;
    x(n)= d(n)+v(n);
end

EQMinValues = zeros(1,10);
GainValues = zeros(1,10);
PValues = zeros(1,10);

j = 1;
for P = 5:5:50
    PValues(1,j) = P;
    Rx = zeros(P,P);
    xP = x(1,1:P);
    Rx = transpose(xP).*xP;
    Rd = zeros(P,P);
    dP = d(1,1:P);
    Rd = transpose(dP).*dP;
    rd = transpose(Rd(1,:));
    Wopt = inv(Rx)*rd;

    %Sortie du filtre
    dchap = zeros(1,N);
    Xbuffer = zeros(P,1);
    for i=1:N
        Xbuffer = [x(i);Xbuffer(1:P-1,:)];
        dchap(i) = transpose(Wopt)*Xbuffer;
    end

    %EQMin
    EQMin = rd(1,1) - transpose(Wopt)*rd;
    EQMin = abs(EQMin);
    EQMinValues(1,j) = EQMin;
    
    
    %gain
    RSBav = 10*log(rd(1,1)/(sigmav^2));
    Rv = zeros(P,P);
    vP = v(1,1:P);
    Rv = transpose(vP).*vP;
    RSBap = 10*log((transpose(Wopt)*Rd*Wopt/(transpose(Wopt)*Rv*Wopt)));
    gain = RSBap - RSBav;
    GainValues(1,j) = gain;
    
    j=j+1;
end
%plot(PValues,EQMinValues);
plot(PValues,GainValues);

