%fft frequency


Fs = 195;                  
T = 1/Fs;
y=ecg1;
L = length(y);%add signal
t = (0:L-1)*T;


Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

figure(1)
f = Fs*(0:(L/2))/L;
plot(f,P1) 

50+++0.0072---94+++0.0136
159+++0.0044---203+++0.0131
191+++0.0102---235+++-0.0048
215+++-0.0023---259+++0.0006
435+++0.0172---479+++0.0012