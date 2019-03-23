function [ Jgetmfilter ] = Bandpass_getHOM(fsm,Jgetm,Bandpass_filter_Centre,Bandpass_filter_Gap )
%ͨ����ƴ�ͨ�˲����õ���ĳ���ֵ
%   

%% ��������
Bandpass_filter_interval = 4;%��ͨ����ļ��
%% ��ͨ�˲������ 
Bandpass_filter_s1 = Bandpass_filter_Centre - Bandpass_filter_Gap/2 - Bandpass_filter_interval/2;
Bandpass_filter_p1 = Bandpass_filter_Centre - Bandpass_filter_Gap/2 + Bandpass_filter_interval/2;
Bandpass_filter_p2 = Bandpass_filter_Centre + Bandpass_filter_Gap/2 - Bandpass_filter_interval/2;
Bandpass_filter_s2 = Bandpass_filter_Centre + Bandpass_filter_Gap/2 + Bandpass_filter_interval/2;
Bandpass_ws1 = Bandpass_filter_s1*pi/fsm;%ת��Ϊ��Ƶ��
Bandpass_wp1 = Bandpass_filter_p1*pi/fsm;
Bandpass_wp2 = Bandpass_filter_p2*pi/fsm;
Bandpass_ws2 = Bandpass_filter_s2*pi/fsm;
Bandpass_width = min((Bandpass_wp1 - Bandpass_ws1),(Bandpass_ws2 - Bandpass_wp2));%���ɴ�����
m = ceil(6.6*pi/Bandpass_width);
Bandpass_w_cutoff1 = (Bandpass_ws1 + Bandpass_wp1)/(2*pi);
Bandpass_w_cutoff2 = (Bandpass_ws2 + Bandpass_wp2)/(2*pi);
Bandpass_w_cutoff = [Bandpass_w_cutoff1,Bandpass_w_cutoff2];
Bandpass_IR = fir1(m,Bandpass_w_cutoff);%��ͨ�˲�����ϵ������

%% ͨ����ͨ�˲���,�õ�Igetm11spec(LP11)
output11 = conv(Bandpass_IR,Jgetm);%ͨ���˲����õ����ź�(��Jgetm����ͨ�˲�)
Jgetmfilter = output11((m/2+1):(length(output11)-m/2));%�����˲�������ʱ����ͷȥβ��
% Igetm11 = Jgetmfilter.^2;
% Igetm11spec = 2*trapz(Fre,Igetm11);%������Ƶ�׵Ļ��ֵõ��ܵĹ�ǿ������Ƶ���ǲ���Ҳ������ȥ�ˣ��ʳ���2��

end

