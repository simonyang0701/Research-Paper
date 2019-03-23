clear all
clc

load('Breath_lowpassed.mat')

%Breath_lowpassed=Heartbeat_lowpassed
nor = mapminmax(Heartbeat_lowpassed',0,1);
BB_1 = nor(50001:100000);
BB_2 = nor(150001:200000);
BB_3 = nor(250001:300000);
BB_4 = nor(300001:350000);

SamplingRate = 1000;
t = length(BB_2)/SamplingRate;

T = 1/SamplingRate;
L = 50000;
t = (0:L-1)*T;

y = t;

a=0;
b=0;
c=1;
z=-0.2:0.03:1;
q=0:5:50;
[z q]=meshgrid(z,q);
x=a*z+b*q+c;

n = 1;
touming = 0.8;
yanse = [0 1 1]

figure (2)
y(1,:) = 1;
plot3(y,t,BB_4-0.15,'LineWidth',2,'color',yanse)
hold on
y(1,:) = y(1,:)+n;
plot3(y,t,BB_3-0.1,'LineWidth',2,'color',yanse)
hold on
y(1,:) = y(1,:)+n;
plot3(y,t,BB_2-0.05,'LineWidth',2,'color',yanse)
hold on
y(1,:) = y(1,:)+n;
plot3(y,t,BB_1,'LineWidth',2,'color',yanse)
hold on

% grid_color = [0.18,0.55,0.34];
grid_color = [0.5,0.5,0.5];
h1=surf(x,q,z);
set(h1,'edgecolor',grid_color);
alpha(touming)
hold on
% legend('80 bpm','location','northeast');

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
zticks([0.4 0.55 0.7 0.85 1])
zticklabels({'-1' '-0.5' '0' '0.5' '1'})
zlabel('Intensity')
ylabel('Time(s)')
xlabel('Duration(min)')
grid on
axis([1 1+3*n 0 50 0.4 1])
set(gca,'FontSize',20);
set(gcf,'unit','centimeters','position',[0 0 30 18]);

