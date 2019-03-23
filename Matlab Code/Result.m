clear all

sit = csvread ('DATA.CSV', 1 ,0);
on = csvread ('DATA_1.CSV', 1 ,0);
bm = csvread ('DATA_2.CSV', 1 ,0);
off = csvread ('DATA_3.CSV', 1 ,0);

sitsg = csvread ('TFZ_sit_SG.CSV', 1 ,0);
onsg = csvread ('TFZ_ONBed_SG1.CSV', 1 ,0);
bmsg = csvread ('TFZ_BM_SG5.CSV', 1 ,0);
offsg = csvread ('TFZ_OffBed_SG.CSV', 1 ,0);


bm2 = csvread ('TFZ_BYM.CSV', 1 ,0);
sit2 = csvread ('TFZ_SIT.CSV', 1 ,0);
on2 = csvread ('TFZ_OnBed.CSV', 1 ,0);

% SIT = sit(4:4:300000);
% ON = on(4:4:300000);
% BM = bm(4:4:300000);
OFF = off(4:4:300000);
BM = bm2(4:4:300000);
SIT = sit2(4:4:300000);
ON = on2(4:4:300000);

% wavelet = ON(43000:58360);

OFFSG = offsg(4:2000:300000);
BMSG = bmsg(10004:2000:310000);
SITSG = sitsg(4:2000:300000);
ONSG = onsg(4:2000:300000);


Fs1 = 1024;
T1 = 1/Fs1;
L1 = 302033;
t1 = (0:L1-1)*T1;

Fs2 = 256;
T2 = 1/Fs2;
L2 = 75000;
t2 = (0:L2-1)*T2;

% figure (1)
% plot (t1,sit);
% figure (2)
% plot (t2,SIT);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%sit
% p = fix(length(SIT)/256);
% SIT2 = SIT(1:p*256);
% SITD = reshape(SIT2,256,p);
p = fix(length(SIT)/500);
SIT2 = SIT(1:p*500);
SITD = reshape(SIT2,500,p);


j = 10;
n = 1;
i = 1;
r = 0;

% for n = 1:292
%     A = SITD(:,n);
%     for i = 1:236
%         diff(i) = (A(i+2*j)-A(i+j))-(A(i+j)-A(i));
%         r=r+abs(diff(i));
%     end
%     result(:,n) = r;
%     r = 0;
% end

for n = 1:150
    A = SITD(:,n);
    for i = 1:480
        diff(i) = (A(i+2*j)-A(i+j))-(A(i+j)-A(i));
        r=r+abs(diff(i));
    end
    result(:,n) = r;
    r = 0;
end

t3 = (1:1:150);
SITM=mean(result(:));
% result2 = result/75;

% figure (3)
% scatter(t3,result)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%off
OFF2 = OFF(1:p*500);
OFFD = reshape(OFF2,500,p);

j = 10;
n = 1;
i = 1;
r = 0;

for n = 1:150
    A = OFFD(:,n);
    for i = 1:480
        diff(i) = (A(i+2*j)-A(i+j))-(A(i+j)-A(i));
        r=r+abs(diff(i));
    end
    resultoff(:,n) = r;
    r = 0;
end

OFFM=mean(resultoff(:));

% resultoff2 = resultoff/20;

% figure (4)
% scatter(t3,resultoff)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ON

ON2 = ON(1:p*500);
OND = reshape(ON2,500,p);

j = 10;
n = 1;
i = 1;
r = 0;

for n = 1:150
    A = OND(:,n);
    for i = 1:480
        diff(i) = (A(i+2*j)-A(i+j))-(A(i+j)-A(i));
        r=r+abs(diff(i));
    end
    resultON(:,n) = r;
    r = 0;
end
ONM=mean(resultON(:));
% figure (5)
% scatter(t3,resultON)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%BM

BM2 = BM(1:p*500);
BMD = reshape(BM2,500,p);

j = 10;
n = 1;
i = 1;
r = 0;

for n = 1:150
    A = BMD(:,n);
    for i = 1:480
        diff(i) = (A(i+2*j)-A(i+j))-(A(i+j)-A(i));
        r=r+abs(diff(i));
    end
    resultBM(:,n) = r;
    r = 0;
end

BMM=mean(resultBM(:));

% figure (6)
% scatter(t3,resultBM)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ALL
W = 150
T1 = (1:1:W);
T2 = (W+1:1:2*W);
T3 = (2*W+1:1:3*W);
T4 = (3*W+1:1:4*W);
SG(1:4*W,1) = (1:1:4*W);
SG(1:W,2) = SITSG;
SG(W+1:1:2*W,2) = BMSG;
SG(2*W+1:1:3*W,2) = ONSG;
SG(3*W+1:1:4*W,2) = OFFSG;

for i = 1:600
    P(i,1) = 300001;
end

figure(7)
scatter(T1,result,30)
hold on
scatter(T2,resultBM,30)
hold on
scatter(T3,resultON,30)
hold on
scatter(T4,resultoff,30,[0.5,0,0])
hold on
plot([150 150],[0 200000],'k--','LineWidth',1.5)
hold on
plot([300 300],[0 200000],'k--','LineWidth',1.5)
hold on
plot([450 450],[0 200000],'k--','LineWidth',1.5)
hold on
plot([0 W],[SITM SITM],'-.','LineWidth',4,'Color',[0,0.447,0.741])
hold on
xlabel('5 min                           5 min                           5 min                            5 min')
plot([W+1 2*W],[BMM BMM],'-.','LineWidth',4,'Color',[0.85,0.325,0.098])
hold on
plot([2*W+1 3*W],[ONM ONM],'-.','LineWidth',4,'Color',[0.929,0.694,0.125])
hold on
plot([3*W+1 4*W],[OFFM OFFM],'-.','LineWidth',4,'Color',[0.5,0,0])
hold on

A2 = plot(T1,SITSG*200000/600,'LineWidth',2,'Color',[0.466,0.674,0.188])
hold on
plot(T2,BMSG*200000/600,'LineWidth',2,'Color',[0.466,0.674,0.188])
hold on
plot(T3,ONSG*200000/600,'LineWidth',2,'Color',[0.466,0.674,0.188])
hold on
plot(T4,OFFSG*200000/600,'LineWidth',2,'Color',[0.466,0.674,0.188])
hold on

scatter(500-20,470*200000/600,30,[0,0.447,0.741])
hold on
scatter(505.5-20,470*200000/600,30,[0.85,0.325,0.098])
hold on
scatter(511-20,470*200000/600,30,[0.929,0.694,0.125])
hold on
scatter(516.5-20,470*200000/600,30,[0.5,0,0])
hold on
A1 = plot(SG(:,1),P,'w:')
hold on
% scatter(T1,SITSG,30,'k')
% hold on
% scatter(T2,BMSG,30,'k')
% hold on
% scatter(T3,ONSG,30,'k')
% hold on
% scatter(T4,OFFSG,30,'k')
% hold on
[AX,H1,H2] = plotyy(SG(:,1),0,SG(:,1),0);
% set(H1, 'Marker', '*');
% set(H1, 'MarkerEdgeColor', 'k');
% set(H2, 'Marker', '+');
% set(H2, 'MarkerEdgeColor', [0.5,0,0]);
% set(H2,'Linestyle',':')
hold off
set(AX(1),'ylim',[0,200000],'ytick',[0:50000:200000]);
set(AX(2),'ylim',[0,600],'ytick',[0:150:600]);
% set(H2,'Linewidth',1.5,'color',[0.5,0,0]);
set(AX(2),'Xcolor','k','Ycolor','k');
set(get(AX(2),'Ylabel'),'string','Intensity (a.u.)','color',[0.466,0.674,0.188]);
set(AX,'FontSize',20);
ylabel('Result (a.u.)');
set(gca,'xtick',[])
grid on
h = legend([A1,A2],{'Fiber signal';'Electrical signal'});
set(h,'box','off')