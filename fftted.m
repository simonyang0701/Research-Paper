
Fs = 195/2;%Sampling Rate
Signal = ecg1;
T = 1/Fs;    
L = length(Signal);
t = (0:L-1)*T;

Y = fft(Signal);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

figure(1)
f = Fs*(0:(L/2))/L;
plot(f,P1)
% axis([0 5 0 20])
