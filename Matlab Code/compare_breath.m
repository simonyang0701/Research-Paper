close all
clear all
clc

%%
load('Breath_lowpassed.mat')

Breath = Heartbeat_lowpassed;
Breath = Breath (200001:260000);
Fs = 1000;
T = 1/Fs;
L = length(Breath);
t = (0:L-1)*T;
[f,P] = fft_func(Fs,Breath);


%%
figure (1)
plot(t,Breath,'LineWidth',2,'color','b')
grid on
yticks([700 750 800 850 900 950])
yticklabels({'0' '0.2' '0.4' '0.6' '0.8' '1'})
set(gca,'FontSize',15);
ylabel('Intensity')
xlabel('Time(s)')
set(gcf,'unit','centimeters','position',[0 5 35 12]);

figure(2)
plot(f,P,'LineWidth',2,'color','r')
axis([0 3 0 80])
grid on
set(gcf,'unit','centimeters','position',[0 5 20 8]);
set(gca,'FontSize',12);
ylabel('Amplitude')
xlabel('Frequence(Hz)')
set(gcf,'unit','centimeters','position',[0 5 15 8]);
