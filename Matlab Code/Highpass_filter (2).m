function [ Result ] = Highpass_filter( Fs,signal,F_pass,F_stop,R_pass,R_stop )
%   Fs: Sampling rate of Signal
%   signal: Signal
%   F_pass: ͨ����ֹƵ��
%   F_stop: �����ֹƵ��
%   R_pass���ߴ���˥��DB������
%   R_stop����ֹ��˥��DB������

%% ��ͨ�˲������
wp = F_pass*2*pi/Fs;%ͨ����ֹ��Ƶ��
ws = F_stop*2*pi/Fs;%�����ֹ��Ƶ��

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

