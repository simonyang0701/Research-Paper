function [ Jgetmfilter ] = Bandpass_getHOM(fsm,Jgetm,Bandpass_filter_Centre,Bandpass_filter_Gap )
%通过设计带通滤波器得到在某点的值
%   

%% 参数定义
Bandpass_filter_interval = 4;%带通左带的间隔
%% 带通滤波器设计 
Bandpass_filter_s1 = Bandpass_filter_Centre - Bandpass_filter_Gap/2 - Bandpass_filter_interval/2;
Bandpass_filter_p1 = Bandpass_filter_Centre - Bandpass_filter_Gap/2 + Bandpass_filter_interval/2;
Bandpass_filter_p2 = Bandpass_filter_Centre + Bandpass_filter_Gap/2 - Bandpass_filter_interval/2;
Bandpass_filter_s2 = Bandpass_filter_Centre + Bandpass_filter_Gap/2 + Bandpass_filter_interval/2;
Bandpass_ws1 = Bandpass_filter_s1*pi/fsm;%转换为角频率
Bandpass_wp1 = Bandpass_filter_p1*pi/fsm;
Bandpass_wp2 = Bandpass_filter_p2*pi/fsm;
Bandpass_ws2 = Bandpass_filter_s2*pi/fsm;
Bandpass_width = min((Bandpass_wp1 - Bandpass_ws1),(Bandpass_ws2 - Bandpass_wp2));%过渡带带宽
m = ceil(6.6*pi/Bandpass_width);
Bandpass_w_cutoff1 = (Bandpass_ws1 + Bandpass_wp1)/(2*pi);
Bandpass_w_cutoff2 = (Bandpass_ws2 + Bandpass_wp2)/(2*pi);
Bandpass_w_cutoff = [Bandpass_w_cutoff1,Bandpass_w_cutoff2];
Bandpass_IR = fir1(m,Bandpass_w_cutoff);%带通滤波器的系数矩阵

%% 通过带通滤波器,得到Igetm11spec(LP11)
output11 = conv(Bandpass_IR,Jgetm);%通过滤波器得到的信号(对Jgetm做带通滤波)
Jgetmfilter = output11((m/2+1):(length(output11)-m/2));%补偿滤波器的延时（掐头去尾）
% Igetm11 = Jgetmfilter.^2;
% Igetm11spec = 2*trapz(Fre,Igetm11);%在整个频谱的积分得到总的光强（将负频率那部分也包含进去了，故乘以2）

end

