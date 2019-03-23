% clear all

A = MZISignal9%(2951:19525);
Z= mapminmax(A',0,1);
Y = smooth(Z);
L= 16575;
T= 1/195;
t = (0:L-1)*T;

a = t';
b = Y';
% 
% figure (1)
% plot(a,b,'k');
% set(gca,'FontSize',30);
% axis([1 85 0 1]);
% xlabel('Time (s)');
% ylabel('Intensity (a.u.)');




j=100;
L=length(Y);
result = (abs(Y(1+j+j:L)-2*Y(1+j:L-j)+Y(1:L-j-j)));

L2=16575;
t2 = (0:L2-1)*T;


R = result(2951:19525); 
R1= mapminmax(R',0,1);
figure (2)
plot(t2,R1,'b');
axis([1 85 0 1]);
set(gca,'FontSize',30);
xlabel('Time (s)');
ylabel('Jitter level (a.u.)');

n = 1;
i = 1;
sum_1=0;
for n=600:31000
    for i=n-599:n
        sum_1 = sum_1 + result(i);
    end
    s(n,1)=sum_1;
    sum_1=0;
end

L3=31000;
t3 = (0:L3-1)*T;

figure (3)
plot(t3,s);
% axis([1 90 0 250]);
xlabel('Time (s)');
ylabel('Normalized Intensity (a.u.)');

judge = 0;
L4=30000;
t4 = (0:L4-1)*T;
for n=1:30000
    if s(n,1)> 84 %bodymovement
        judge(n,1) = 2;
        if s(n-500,1)>15&&s(n-500,1)<84
           judge(n,1) = 1;
        end
        if s(n-1000,1)<15
           judge(n,1) = 0;
        end
    end    
    if s(n,1)<=84&&s(n,1)>15 %onthebed
        judge(n,1) = 1;
        if s(n-800,1)>84&&s(n+800,1)<15
           judge(n,1) = 0;
        end
        if s(n+800,1)>84&&s(n-800,1)<15
           judge(n,1) = 0;
        end
    end
    if s(n,1)<15%offthebed
        judge(n,1) = 0;
    end
    n = n+1;
end

L5=30000;
t5 = (0:L5-1)*T;
% AS = judge(2951:19525);

figure(4)
plot(t5,judge,'b','LineWidth',2);
% set(gca,'FontSize',30);
% axis([0 85 0 2]);
xlabel('Time (s)');
ylabel('Status');


L6=32194;
t6 = (0:L6-1)*T;
figure(1)
plot(t6,MZISignal9,'b','LineWidth',2);
% set(gca,'FontSize',30);
% axis([0 85 0 2]);
xlabel('Time (s)');
ylabel('Status');
