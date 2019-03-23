clear all
clc

%%
onbed = csvread('better.csv',1,0);
bm = csvread('STATE_2.csv',1,0);
offbed = csvread('STATE_4.csv',1,0);
onbed = onbed(1:120000);
bm = bm(5001:125000);
offbed = offbed(1:120000);
offbed = smooth(offbed,10);

offbed = smooth(offbed,10);
% bm = smooth(bm,10);
% onbed = smooth(onbed,10);

SamplingRate = 1000;
bm = bm/4;
onbed = onbed/4;

%%
% view_on = onbed;
% view_bm = bm;
% view_off = offbed;
% 
% T = 1/SamplingRate;
% L_v = length(onbed);
% t_v = (0:L_v-1)*T;

% figure (1)
% plot(t_v,view_on,'LineWidth',1.5,'color','b')
% set(gcf,'unit','centimeters','position',[0 14 10 4]);
% % axis([0 30 0 1000])
% 
% figure (2)
% plot(t_v,view_bm,'LineWidth',1.5,'color','b')
% set(gcf,'unit','centimeters','position',[0 8 10 4]);
% % axis([0 30 0 10000])
% 
% figure (3)
% plot(t_v,view_off,'LineWidth',1.5,'color','b')
% set(gcf,'unit','centimeters','position',[0 2 10 4]);

%%
n_group = 1000;
p = fix(length(onbed)/n_group);
onbed = reshape(onbed,n_group,p);
bm = reshape(bm,n_group,p);
offbed = reshape(offbed,n_group,p);

j = 3;
n = 1;
i = 1;
r_a = 0;
r_b = 0;
r_c = 0;

for n = 1:p
    A = onbed(:,n);
    B = bm(:,n);
    C = offbed(:,n);
    for i = 1:n_group-2*j
        diff_a(i) = (A(i+2*j)-A(i+j))-(A(i+j)-A(i));
        r_a=r_a+abs(diff_a(i));
        diff_b(i) = (B(i+2*j)-B(i+j))-(B(i+j)-B(i));
        r_b=r_b+abs(diff_b(i));
        diff_c(i) = (C(i+2*j)-C(i+j))-(C(i+j)-C(i));
        r_c=r_c+abs(diff_c(i));
    end
    result_on(:,n) = r_a;
    result_bm(:,n) = r_b;
    result_off(:,n) = r_c;
    r_a = 0;
    r_b = 0;
    r_c = 0;
end

%%
a_on = mean(result_on(:));
a_bm = mean(result_bm(:));
a_off = mean(result_off(:));


%%
ta = (1:1:p);
tb = (p+1:1:2*p);
tc = (2*p+1:1:3*p);

figure (4)
H1 = scatter(ta,result_bm,100,'filled');
hold on
H2 = scatter(tb,result_on,100,'filled');
hold on
H3 = scatter(tc,result_off,100,'filled');
hold on
% legend([H1 H2 H3], 'bodymovement','on bed','off bed')
axis([0 360 0 5000])

plot([120 120],[0 200000],'k--','LineWidth',1.5)
hold on
plot([240 240],[0 200000],'k--','LineWidth',1.5)
hold on

plot([0 p],[3000 3000],'-.','LineWidth',3,'Color','k')%[0,0.447,0.741])
hold on
plot([p+1 2*p],[a_on a_on],'-.','LineWidth',3,'Color','k')%[0.85,0.325,0.098])
hold on
plot([2*p+1 3*p],[a_off a_off],'-.','LineWidth',3,'Color','k')%[0.929,0.694,0.125])
hold on

ylabel('Intensity')
xlabel('Time(s)')
set(gca,'FontSize',20);

% scatter(280,4500,100,[0,0.447,0.741],'filled')
% hold on
% scatter(285,4500,100,[0.85,0.325,0.098],'filled')
% hold on
% scatter(290,4500,100,[0.929,0.694,0.125],'filled')

grid on

