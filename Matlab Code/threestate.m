clear all
clc

%%
onbed = csvread('better.csv',1,0);
bm = csvread('STATE_2.csv',1,0);
offbed = csvread('STATE_4.csv',1,0);
onbed = onbed(1:160000);
SamplingRate = 1000;

%%
% onbed = mapminmax(onbed',0,5000);
% bm = mapminmax(bm',0,5000);
% offbed = mapminmax(offbed',0,5000);
offbed = smooth(offbed,10);
% onbed = Lowpass_getDCandJ(SamplingRate,onbed,25);

%%
onbed = onbed(38001:68000);
bm = bm(20001:50000);
offbed = offbed(20001:50000);

%%
T = 1/SamplingRate;
L_on = length(onbed);
t_on = (0:L_on-1)*T;
L_bm = length(bm);
t_bm = (0:L_bm-1)*T;
L_off = length(offbed);
t_off = (0:L_off-1)*T;

%%
j=50;

onbed = onbed';
bm = bm';

result_on = (abs(onbed(1+j+j:L_on)-2*onbed(1+j:L_on-j)+onbed(1:L_on-j-j)));
result_bm = (abs(bm(1+j+j:L_bm)-2*bm(1+j:L_bm-j)+bm(1:L_bm-j-j)));
result_off = (abs(offbed(1+j+j:L_off)-2*offbed(1+j:L_off-j)+offbed(1:L_off-j-j)));

L_reon = length(result_on);
L_rebm = length(result_bm);
L_reoff = length(result_off);
t_reon = (0:L_reon-1)*T;
t_rebm = (0:L_rebm-1)*T;
t_reoff = (0:L_reoff-1)*T;


%%
% figure (1)
% plot(t_on,onbed,'LineWidth',1.5,'color','b')
% yticks([0 0.2 0.4 0.6 0.8])
% yticklabels({'0' '0.25' '0.5' '0.75' '1'})
% grid on
% ylabel('Intensity')
% xlabel('Time(s)')
% set(gca,'FontSize',20);
% set(gcf,'unit','centimeters','position',[0 5 35 12]);
% 
% figure (2)
% plot(t_bm,bm,'LineWidth',1,'color','b')
% yticks([0 0.25 0.5 0.75 1])
% yticklabels({'0' '0.25' '0.5' '0.75' '1'})
% grid on
% ylabel('Intensity')
% xlabel('Time(s)')
% set(gca,'FontSize',20);
% set(gcf,'unit','centimeters','position',[0 5 35 12]);
% 
% figure (3)
% plot(t_off,offbed+50,'LineWidth',1.5,'color','b')
% axis([1 30 0 100])
% yticks([0 25 50 75 100])
% yticklabels({'0' '0.25' '0.5' '0.75' '1'})
% grid on
% ylabel('Intensity')
% xlabel('Time(s)')
% set(gca,'FontSize',20);
% set(gcf,'unit','centimeters','position',[0 5 35 12]);

%%
figure (4)
plot(t_reon,result_on,'LineWidth',1.5,'color','b')
set(gcf,'unit','centimeters','position',[0 14 10 4]);
% axis([0 30 0 1000])

figure (5)
plot(t_rebm,result_bm,'LineWidth',1.5,'color','b')
set(gcf,'unit','centimeters','position',[0 8 10 4]);
% axis([0 30 0 10000])

figure (6)
plot(t_reoff,result_off,'LineWidth',1.5,'color','b')
set(gcf,'unit','centimeters','position',[0 2 10 4]);
% axis([0 30 0 1000])