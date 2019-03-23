Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T;        % Time 

S = 0.7*sin(2*pi*50*t);


Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

figure(1)
f = Fs*(0:(L/2))/L;
plot(f,P1);
figure(2)
plot(S);