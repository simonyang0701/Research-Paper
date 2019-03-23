function [f,P] = fft_VitalSigns(SamplingRate,Signal)


%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

L = length(Signal);             % Length of signal

Y = fft(Signal);
P2 = abs(Y/L);
P = P2(1:L/2+1);
P(2:end-1) = 2*P(2:end-1);

% P3 = angle(Y/L);
% Phase = P3(1:L/2+1);
% Phase = Phase*180/pi;
% Phase(2:end-1) = 2*Phase(2:end-1);

f = SamplingRate*(0:(L/2))/L;

end

