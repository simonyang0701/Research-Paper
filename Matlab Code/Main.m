% clear
% close all
% clc


off = csvread ('TFZ_off.CSV', 1 ,0);
bm = csvread ('TFZ_BYM.CSV', 1 ,0);
sit = csvread ('TFZ_SIT.CSV', 1 ,0);
on = csvread ('TFZ_OnBed.CSV', 1 ,0);

TEST = csvread ('0914.CSV', 1 ,0);
ECG = csvread ('TFZ_ECG.CSV', 1 ,0);
breathelc = csvread ('breath0919.CSV', 1 ,0);

sitsg = csvread ('TFZ_sit_SG.CSV', 1 ,0);
onsg = csvread ('TFZ_ONBed_SG1.CSV', 1 ,0);
bmsg = csvread ('TFZ_BM_SG5.CSV', 1 ,0);
offsg = csvread ('TFZ_OffBed_SG.CSV', 1 ,0);



OFF = off(4:4:300000);
BM = bm(4:4:300000);
SIT = sit(4:4:300000);
ON = on(4:4:300000);


OFFSG = offsg(4:2000:300000);
BMSG = bmsg(10004:2000:310000);
SITSG = sitsg(4:2000:300000);
ONSG = onsg(4:2000:300000);


ondraw = ON(43001:58360);

ecg = ECG(51:4050)/1.5-150;
test = denoise0914(11001:16120)/1.5-250;
% te1 = TEST(1:61440);


Fs1 = 800;
T1 = 1/Fs1;
L1 = 4000;
t1 = (0:L1-1)*T1;

Fs2 = 1024;
T2 = 1/Fs2;
L2 = 5120;
t2 = (0:L2-1)*T2;

Fs3 = 256;
T3 = 1/Fs3;
L3 = 15361;
t3 = (0:L3-1)*T3;

L4 = 5120;
t4 = (0:L4-1)*T3;
denoise2 = denoise(10241:15360);

belc2 = breathelc(89721-30720:151160-30720);
belc3 = smooth(belc2,19);
belc4 = smooth(belc3,19);
belc5 = smooth(belc4,19);
belc = (belc5 - 600)*2+200;
% belc = belc5;
Fs5 = 980;
T5 = 1/Fs5;
L5 = 58800;
t5 = (0:L5-1)*T5;

BELC2 = belc(4:490:58800);
Fs6 = 2;
T6 =  1/Fs6;
L6 = 120;
t6 = (0:L6-1)*T6;
BELC = smooth(BELC2,10);
% j = 10;
% r = 0;
% R = reshape(test,256,20);
% for n = 1:20
%     A = R(:,n);
%     for i = 1:235
%         diff(i) = (A(i+2*j)-A(i+j))-(A(i+j)-A(i));
%         r=r+abs(diff(i));
%     end
%     result(:,n) = r;
%     r = 0;
% end

figure(1)
A1 = plot(t1,ecg,':','LineWidth',2,'Color',[0.5451,0.4902,0.41961])
hold on
A2 = plot(t2,test,'LineWidth',2,'Color','r')
hold off
ylabel('Intensity (a.u.)');
xlabel('Time (s)');
legend([A1,A2],{'ECG';'MZI'})
set(gca,'FontSize',20);
set(gcf,'unit','centimeters','position',[0 0 20 13]);


figure(2)
A3 = plot(t6,BELC-200,':','LineWidth',2,'Color',[0.5451,0.4902,0.41961])
hold on
A4 = plot(t3,breath/3+100,'LineWidth',2,'Color',[0.18039,0,0.80392])
hold off
ylabel('Intensity (a.u.)');
xlabel('Time (s)');
set(gca,'FontSize',20);
set(gcf,'unit','centimeters','position',[0 0 20 13]);
axis([0 60 180 300]);
legend([A3,A4],{'Electric signal','MZI'})


figure(3)
% A5 = plot(t4,denoise2,'LineWidth',2,'Color',[0.18431,0.3098,0.3098])
A5 = plot(t4,denoise2,'LineWidth',2,'Color','k')
ylabel('Intensity (a.u.)');
xlabel('Time (s)');
set(gca,'FontSize',20);
legend([A5],{'MZI'})
grid on