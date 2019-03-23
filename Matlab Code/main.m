close all
clear all
clc

%%
% BCG_1 = csvread('better.csv',1,0);
% BCG_2 = csvread('heart_2.csv',1,0);
% BCG_2 = BCG_2(1:23000);
% Fs = 1000;
Heartbeat = csvread('BCG_ECG_4.csv',1,0);
Fs = 550;
ECG = Heartbeat(2:2:end);
ECG = 1024-ECG;
BCG = Heartbeat(1:2:end);
% BCG = BCG(8*Fs+1:22*Fs);
% ECG = ECG(8*Fs+1:22*Fs);

%% filter
% BCG = Highpass_filter(Fs,BCG,0.5,0.3,0.1,20);

% BCG = Lowpass_filter(Fs,BCG,20,30,1.1,30);
% ECG = Lowpass_filter(Fs,ECG,30,35,0.1,20);

BCG = Lowpass_getDCandJ(Fs,BCG,25);
ECG = Lowpass_getDCandJ(Fs,ECG,80);

%%
BCG = BCG(1*Fs+1:38*Fs);
ECG = ECG(1*Fs+1:38*Fs);
BCG = mapminmax(BCG',0,1);
ECG = mapminmax(ECG',0,1);
BCG = smooth(BCG,10);
ECG = smooth(ECG,10);
% ECG = smooth(ECG);
BCG = BCG(10*Fs+1:20*Fs);
ECG = ECG(10*Fs+1:20*Fs);

%%
T = 1/Fs;
L = length(BCG);
t = (0:L-1)*T;

%%
figure (1)
plot (t,ECG/1.5+0.2,'LineWidth',1.5,'color','r')
hold on
plot (t,BCG*2.5-0.6,'LineWidth',2,'color','b')
axis([0 10 0 1])
grid on
set(gca,'FontSize',15);
ylabel('Intensity')
xlabel('Time(s)')
legend('ECG signal (Reference)','BCG signal (Processed)')
set(gcf,'unit','centimeters','position',[0 5 35 12]);


% figure (2)
% plot (t,BCG_1)
% xlim([15 25])

