clear all;
close all;
w0 = 0.05*pi;
Nrea = 1;
P = 5;
N = 10000;
mv=0;
phi=pi/2;
%bruit
sigma = sqrt(0.01);
  for i=1:Nrea
    for n=1:N
      V= mv+ sigma * randn(1,N);
    end
    Vmat(i,:) = V;
  end

  
%x=d+v wop=Rx^(-1) * rd
%signal d
 somme = 0;
 for i=1: Nrea
   for n=1:N
    
    %phi = 2*pi*rand;
    d(n) = sin(n * w0 + phi);
   end
  Dmat(i,:) = d;
 end
x=d+V;
Fs= 44100;
sound(d,Fs);

%vecteur rd autocorrelation de D 
Dcar = Dmat.*Dmat;
 for k=0: P-1
   for n=k+1:N
     somme =somme+ d(n)*d(n-k);
   end
  r(k+1)=somme/(N-k);

 end
disp(r);

rx = xcorr(x,P-1);
% methode de Xcorr
vec = (rx/(N-P+1));
rx=toeplitz(vec(P:(2*P-1)));


rd = xcorr(d,P-1);
% methode de Xcorr
vec = (rd/(N-P+1));
rd=toeplitz(vec(P:(2*P-1)));


Wopt=inv(rx)*r;

Xbuffer=zeroes(P,1);
for n=1:p
    Xbuffer= [x(n);Xbuffer(1:P-1)];
    dhat(n)=Wopt' * Xbuffer ;
end

plot(dhat,'r');
hold on;
plot(d,'v');
hold on;
plot(x,'b');

//3 performances:
/* afficher d,d^,x
EQM error 
et les DEUX RSB RSBavant et RSBapres 
