function [ Igetm01] = Lowpass_getDCandJ(fsm,Igetm,Lowpass_filter_s )
%通过低通滤波器得到直流成分
%   通过低通滤波器得到直流成分，再得到J（x,y,w）
%   fsm: Sampling rate
%   Igetm: Signal
%   Lowpass_filter_s: badnwidth of low-pass filter

%% 参数定义

%% 低通滤波器设计
Lowpass_filter_p = 0;%通带截止频率(Hz)
Lowpass_wp = Lowpass_filter_p*pi/fsm;
Lowpass_ws = Lowpass_filter_s*pi/fsm;
Lowpass_width = Lowpass_ws - Lowpass_wp;
n = ceil(6.6*pi/Lowpass_width);
Lowpass_w_cutoff = (Lowpass_wp + Lowpass_ws)/(2*pi);
Lowpass_IR = fir1(n,Lowpass_w_cutoff);%低通滤波器的系数矩阵

%% 低通滤波得到DC(Igetm01spec)、Jgetm(J(x,y,w))
output01 = conv(Lowpass_IR,Igetm);%通过滤波器得到的信号
Igetm01 = output01((n/2+1):(length(output01)-n/2));%补偿滤波器的延时（掐头去尾）(注意n的奇偶)
% Igetm01spec = trapz(Fre,Igetm01);%光强值在频谱的积分得到总的光强
end

