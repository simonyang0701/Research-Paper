function [ Igetm01] = Lowpass_getDCandJ(fsm,Igetm,Lowpass_filter_s )
%ͨ����ͨ�˲����õ�ֱ���ɷ�
%   ͨ����ͨ�˲����õ�ֱ���ɷ֣��ٵõ�J��x,y,w��
%   fsm: Sampling rate
%   Igetm: Signal
%   Lowpass_filter_s: badnwidth of low-pass filter

%% ��������

%% ��ͨ�˲������
Lowpass_filter_p = 0;%ͨ����ֹƵ��(Hz)
Lowpass_wp = Lowpass_filter_p*pi/fsm;
Lowpass_ws = Lowpass_filter_s*pi/fsm;
Lowpass_width = Lowpass_ws - Lowpass_wp;
n = ceil(6.6*pi/Lowpass_width);
Lowpass_w_cutoff = (Lowpass_wp + Lowpass_ws)/(2*pi);
Lowpass_IR = fir1(n,Lowpass_w_cutoff);%��ͨ�˲�����ϵ������

%% ��ͨ�˲��õ�DC(Igetm01spec)��Jgetm(J(x,y,w))
output01 = conv(Lowpass_IR,Igetm);%ͨ���˲����õ����ź�
Igetm01 = output01((n/2+1):(length(output01)-n/2));%�����˲�������ʱ����ͷȥβ��(ע��n����ż)
% Igetm01spec = trapz(Fre,Igetm01);%��ǿֵ��Ƶ�׵Ļ��ֵõ��ܵĹ�ǿ
end

