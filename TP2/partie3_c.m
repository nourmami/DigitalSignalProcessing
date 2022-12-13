close all;
clear all;

w0 = 0.05*pi;
phi = 0;
sigmavCarre = 0.1;
P = 10;

[d,Fs] = audioread('C:\aaa.wav');
Ts = 1/Fs;
Lt = 3/Ts;
Nt = 10;
N = Lt*Nt;
T = N*Ts;
d = d(1:N,1);
d = transpose(d);
%sound(d,Fs);

%bruit
v = zeros(1,N);
x = zeros(1,N);

for n=1:N
    v(n)=sigmavCarre*randn;
    x(n)= d(n)+v(n);
end
noisy = transpose(x);
%sound(noisy,Fs);
dMat = reshape(d,[Lt,Nt]);
EQMinTrames = zeros(1,Nt);
gainTrames = zeros(1,Nt);
for i=1:Nt
    xi = zeros(1,N);
    di = transpose(dMat(:,i));
    [xi,dchapi,EQMini,gaini] = debruitage_sig(di,P,Lt,sigmavCarre);
    Xmat(:,i) = xi;
    DchapMat(:,i) = dchapi;
    EQMinTrames(1,i) = EQMini;
    gainTrames(1,i) = gaini;
end
%reconstruction aprés debruitage
dchap = zeros(1,N*Nt);
dchap = reshape(DchapMat,1,[]);

reconstructed = transpose(dchap);
%sound(reconstructed,Fs);

%statistiques
hist(EQMinTrames);
hist(gainTrames);


