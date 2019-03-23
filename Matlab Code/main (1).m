close all
clc
clear


%% Read
SamplingRate = 1000;
load('RawData.mat')

% Heartbeat = csvread('heart_2.csv',1,0);
Heartbeat = Raw_data;
A = length(Heartbeat)/SamplingRate;
leng = 360*SamplingRate;
Heartbeat = Heartbeat(1:leng);
Duration = (1:leng)./SamplingRate;


%% Filtered
Heartbeat_smoothed = smooth(smooth(Heartbeat));
Heartbeat_lowpassed = Lowpass_getDCandJ(SamplingRate,Heartbeat,1.6);
% run
Heartbeat_bandpass_10 = Bandpass_getHOM(SamplingRate,Heartbeat,11,7);
% stable
Heartbeat_bandpass_5 = Bandpass_getHOM(SamplingRate,Heartbeat,7,5);


 

%% FFT
[f1,P1] = fft_VitalSigns(SamplingRate,Heartbeat);
[f2,P2] = fft_VitalSigns(SamplingRate,Heartbeat_lowpassed);

%% Figure

figure(1)
plot(Duration,Heartbeat)
title('Raw data')

% figure(2)
% plot(Duration,Heartbeat_smoothed)
% title('smooth')
% 
% figure(3)
% plot(f1,P1)
% axis([0 5 0 100])
% title('SmoothFFT')

figure(4)
plot(Duration,Heartbeat_lowpassed,'LineWidth',2,'color','b')
title('lowpass')
% axis([200 260 670 930])
% xticks([200 215 230 245 260])
% xticklabels({'0' '15' '30' '45' '60'})
% yticks([670 735 800 865 930])
% yticklabels({'0' '0.25' '0.5' '0.75' '1'})
% grid on
% ylabel('Intensity')
% xlabel('Time(s)')
% set(gca,'FontSize',20);
% set(gcf,'unit','centimeters','position',[0 0 30 18]);

% figure(5)
% plot(f2,P2)
% axis([0 5 0 12])
% title('LowpassFFT')

% figure(6)
% plot(Duration,Heartbeat_bandpass_5)
% title('bandpass')
% % axis([0 15 1200 1500])

% figure(7)
% plot(Duration,Heartbeat_bandpass_10)
% title('bandpass')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Heartbeat_lowpassed_12s = Heartbeat_lowpassed(101:60100);
% Heartbeat_lowpassed_12s_downsampling = Heartbeat_lowpassed_12s(4:4:60000);
% 
% load('De_Heartbeat_lowpassed_12s_downsampling.mat');
% load('De_Breath_lowpassed_12s_downsampling.mat');
% ECG = csvread ('TFZ_ECG.CSV', 1 ,0);
% 
% S = 4200;
% SamplingRate2 = 1000/4;
% leng2 = 5*SamplingRate2;
% De_Heartbeat_lowpassed_12s_downsampling = De_Heartbeat_lowpassed_12s_downsampling(1+S:leng2+S);
% Duration2 = (1:leng2)./SamplingRate2;
% 
% S2 = 20;
% SamplingRate3 = 740;
% leng3 = 5*SamplingRate3;
% Duration3 = (1:leng3)./SamplingRate3;
% ECG = ECG(1+S2:leng3+S2);
% 
% S3 = 0;
% SamplingRate4 = 1000/4;
% leng4 = 60*SamplingRate4;
% De_Breath_lowpassed_12s_downsampling = De_Breath_lowpassed_12s_downsampling(1+S3:leng4+S3);
% Duration4 = (1:leng4)./SamplingRate4;
% 
% S4 = 100;
% SamplingRate5 = 1000;
% leng5 = 60*SamplingRate5;
% Heartbeat_lowpassed = Heartbeat_lowpassed(1+S4:leng5+S4);
% Duration5 = (1:leng5)./SamplingRate5;
% 
% H = (De_Heartbeat_lowpassed_12s_downsampling-1340);

% figure(6)
% A2 = plot(Duration3,ECG/10,':','LineWidth',2,'Color',[0.5451,0.4902,0.41961])
% hold on
% A1 = plot(Duration2,H,'LineWidth',2,'Color','r')
% hold off
% ylabel('Intensity (a.u.)');
% xlabel('Time (s)');
% set(gca,'FontSize',15);
% set(gcf,'unit','centimeters','position',[0 0 20 13]);
% legend([A1,A2],{'TCF','ECG'})
% axis([0 5 20 55])
% 
% 
% figure(7)
% A3 = plot(Duration4,De_Breath_lowpassed_12s_downsampling,'LineWidth',2,'Color','b')
% ylabel('Intensity (a.u.)');
% xlabel('Time (s)');
% set(gca,'FontSize',15);
% set(gcf,'unit','centimeters','position',[0 0 20 13]);
% legend([A3],{'TCF'})
% axis([0 60 1300 1450])
% 
% figure(8)
% A4 = plot(Duration5,Heartbeat_lowpassed,'LineWidth',2,'Color','k')
% ylabel('Intensity (a.u.)');
% xlabel('Time (s)');
% set(gca,'FontSize',15);
% set(gcf,'unit','centimeters','position',[0 0 20 13]);
% legend([A4],{'TCF'})
% axis([0 60 1280 1470])
% 
% figure(9)
% A5 = plot(Duration5,Heartbeat_lowpassed,'LineWidth',2)
% hold on
% A6 = plot(Duration4,De_Breath_lowpassed_12s_downsampling,':','LineWidth',3,'Color','r')
% hold off
% ylabel('Intensity (a.u.)');
% xlabel('Time (s)');
% set(gca,'FontSize',15);
% set(gcf,'unit','centimeters','position',[0 0 20 13]);
% legend([A5,A6],{'TCF','Wavelet analysis'})
% axis([0 60 1280 1470])
