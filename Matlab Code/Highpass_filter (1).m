function [ Result ] = Highpass_filter( Fs,signal,F_pass,F_stop,R_pass,R_stop )
%   Fs: Sampling rate of Signal
%   signal: Signal
%   F_pass: 通带截止频率
%   F_stop: 阻带截止频率
%   R_pass：边带区衰减DB数设置
%   R_stop：截止区衰减DB数设置

%% 高通滤波器设计
wp = F_pass*2*pi/Fs;%通带截止角频率
ws = F_stop*2*pi/Fs;%阻带截止角频率

[n,wn] = cheb1ord(wp/pi,ws/pi,R_pass,R_stop);
[bz1,az1] = cheby1(n,R_pass,wp/pi,'high');

% [h,w] = freqz(bz1,az1,256,Fs);
% h = 20*log10(abs(h));
% figure;
% plot(w,h);
% title('Filter function')
% grid on

Result = filter(bz1,az1,signal);

end

