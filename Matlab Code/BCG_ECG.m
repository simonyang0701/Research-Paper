clear all
clc

Heartbeat = csvread('BCG_ECG_4.csv',1,0);
SamplingRate = 550;
SamplingRate2 = 1000;

BCG = Heartbeat(1:2:end);
% load('Heartbeat_bandpass_5.mat')
% BCG = Heartbeat_bandpass_5;
ECG = Heartbeat(2:2:end);
% BCG = BCG(1:18622);
BCG_O = BCG;
% BCG = (BCG-700)*3+250;
ECG = 1024-ECG;

% ECG = smooth(smooth(ECG,10));
BCG = Lowpass_getDCandJ(SamplingRate,BCG,25);
ECG = Lowpass_getDCandJ(SamplingRate,ECG,80);
% BCG = Bandpass_getHOM(SamplingRate,BCG,13,12);
% BCG_Lowpass = BCG;

% N = 1950;
% BCG = BCG(246401-N:254400-N);
% ECG = ECG(5501:11000);
BCG = (BCG-800)*3-150;
% BCG = mapminmax(BCG',0,1);
% ECG = mapminmax(ECG',0,1);
% BCG = BCG/2+0.3;
% BCG = 3*(BCG-900)+720;
T = 1/SamplingRate;
L = length(ECG);
t = (0:L-1)*T;
T2 = 1/SamplingRate2;
L2 = length(BCG);
t2 = (0:L2-1)*T2;

% L_Lowpass = length(BCG_Lowpass);
% t_Lowpass = (0:L_Lowpass-1)*T;

% figure (1)
% plot(t_SEE,BCG_SEE,'LineWidth',1.5,'color','b')
% hold on
% plot(t_SEE,BCG_O,'LineWidth',1.5,'color','r')

figure (2)
plot(t,ECG/5,'LineWidth',2,'color','r')
hold on
plot(t,BCG,'LineWidth',2,'color','b')
grid on
% axis([3 38 120 180])
set(gca,'FontSize',20);
set(gcf,'unit','centimeters','position',[0 5 40 12]);
ylabel('Intensity')
xlabel('Time(s)')
% xticks([1 2 3 4 5 6 7 8 9])
% xticklabels({'0' '1' '2' '3' '4' '5' '6' '7' '8'})
