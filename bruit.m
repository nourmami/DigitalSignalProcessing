clear all;
close all;
w0 = 0.05*pi;
Nrea=10;
N = 10000;
mv=0;
sigma = sqrt(0.1);
  for i=1:Nrea
    for n=1:N
      V= mv+ sigma * randn(1,N);
    end
    Vmat (i,:) = v;
  end
  m = mean(Vmat);
  p= mean(Vmat. *Vmat);
  disp(m);
  disp(p);
  histogram(m, 'EdgeColor', 'b');
  hold on
  histogram(p, 'EdgeColor', 'r');
