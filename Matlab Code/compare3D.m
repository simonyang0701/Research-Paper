clear all
clc

load('Heartbeat_bandpass_5.mat')
% load('Heartbeat_bandpass_10.mat')

SamplingRate = 1000;
% Heartbeat_bandpass_5 = Highpass_filter(SamplingRate,Raw_data,2.5,1.8,0.1,20);
% Heartbeat_bandpass_5 = Lowpass_getDCandJ(SamplingRate,Heartbeat_bandpass_5,30);
% % Heartbeat_bandpass_5 = Bandpass_getHOM(SamplingRate,Raw_data,7,5);
% % Heartbeat_bandpass_5 = Lowpass_filter(SamplingRate,Heartbeat_bandpass_5,20,25,0.1,40);

HB_1 = Heartbeat_bandpass_5(128001:133000);
HB_2 = Heartbeat_bandpass_5(197001:202000);
HB_3 = Heartbeat_bandpass_5(246401:251400);
HB_4 = Heartbeat_bandpass_5(301001:306000);
% HB_5 = Heartbeat_bandpass_10(6001:11000);

t = length(HB_2)/SamplingRate;

T = 1/SamplingRate;
L = 5000;
t = (0:L-1)*T;

y = t;

a=0;
b=0;
c=1;
z=-20:2:20;
q=0:0.2:5;
[z q]=meshgrid(z,q);
x=a*z+b*q+c;

n = 1;
touming = 0.8;

figure (1)
y(1,:) = 1;
plot3(y,t,HB_4,'LineWidth',2,'color',[0.49,0.99,0])
hold on
y(1,:) = y(1,:)+n;
plot3(y,t,HB_3,'LineWidth',2,'color',[0.49,0.99,0])
hold on
y(1,:) = y(1,:)+n;
plot3(y,t,HB_2,'LineWidth',2,'color',[0.49,0.99,0])
hold on
y(1,:) = y(1,:)+n;
plot3(y,t,HB_1,'LineWidth',2,'color',[0.49,0.99,0])
hold on

% grid_color = [0.18,0.55,0.34];
grid_color = [0.5,0.5,0.5];
h1=surf(x,q,z);
set(h1,'edgecolor',grid_color);
alpha(touming)
hold on


c = c+n;
x=a*z+b*q+c;
h2=surf(x,q,z);
set(h2,'edgecolor',grid_color);
alpha(touming)
hold on

c = c+n;
x=a*z+b*q+c;
h3=surf(x,q,z);
set(h3,'edgecolor',grid_color);
alpha(touming)
hold on

c = c+n;
x=a*z+b*q+c;
h4=surf(x,q,z);
set(h4,'edgecolor',grid_color);
alpha(touming)
colormap gray
hold on
xticks([1 2 3 4])
xticklabels({'1' '2' '3' '4'})
zticks([-20 -10 0 10 20])
zticklabels({'-1' '-0.5' '0' '0.5' '1'})
zlabel('Intensity')
ylabel('Time(s)')
xlabel('Duration(min)')
grid on
axis([1 1+3*n 0 5 -20 20])
set(gca,'FontSize',20);

