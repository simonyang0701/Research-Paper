% Fs = 95;                  
% T = 1/Fs;    
% L = length(MZISignal);
% t = (0:L-1)*T;
% 
% 
% Y = fft(MZISignal);
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% 
% figure(1)
% f = Fs*(0:(L/2))/L;
% plot(f,P1) 


% for i=1:length(B)
%     A(2,i)=t(1,i);
%     i=i+1;
% end
[b,a]=tf(Hd); %%调用滤波器参数
d=filter(b,a,MZISignal2);%%滤波操作

