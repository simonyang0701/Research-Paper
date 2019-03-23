
clc
close all
clear

TargetNo = 6;
interval = 0.001;
Total = 0:interval:4*TargetNo;
state = zeros(1/interval,4*TargetNo);
for i = 1:4*TargetNo
    state(:,i) = Total((1/interval*(i-1)+1):(1/interval*i));
end

Result_ON = 10*ones(length(state(:,1)),1);
Result_SIT = 20*ones(length(state(:,1)),1);
Result_OFF = 30*ones(length(state(:,1)),1);
Result_MOVE = 40*ones(length(state(:,1)),1);

Result = [Result_ON Result_SIT Result_OFF Result_MOVE];
Marker = 5;
%% figures
% for ii = 1:7
%     
% end

for j = 1:4
    h1 = plot(state(:,6*(j-1)+1),Result(1/interval*(j-1)+1:(1/interval*j)),'or','Markersize',Marker);
    hold on
end
hold on
for j = 1:4
    h2 = plot(state(:,6*(j-1)+2),Result(1/interval*(j-1)+1:(1/interval*j)),'og','Markersize',Marker);
    hold on
end
for j = 1:4
    h3 = plot(state(:,6*(j-1)+3),Result(1/interval*(j-1)+1:(1/interval*j)),'ob','Markersize',Marker);
    hold on
end
for j = 1:4
    h4 = plot(state(:,6*(j-1)+4),Result(1/interval*(j-1)+1:(1/interval*j)),'oc','Markersize',Marker);
    hold on
end
for j = 1:4
    h5 = plot(state(:,6*(j-1)+5),Result(1/interval*(j-1)+1:(1/interval*j)),'om','Markersize',Marker);
    hold on
end
for j = 1:4
    h6 = plot(state(:,6*(j-1)+6),Result(1/interval*(j-1)+1:(1/interval*j)),'ok','Markersize',Marker);
    hold on
end
% hold on
% for k = TargetNo+1:2*TargetNo
%     plot(state(:,k),Result_SIT,'o');
%     hold on
% end
% hold on
% for l = 2*TargetNo+1:3*TargetNo
%     plot(state(:,l),Result_OFF,'o');
%     hold on
% end
% hold on
% for m = 3*TargetNo+1:4*TargetNo
%     plot(state(:,m),Result_MOVE,'o');
%     hold on
% end
hold on
plot([6.4 6.5 6.6 6.66 6.68],[40 40 40 40 40],'or','Markersize',Marker);
hold on
plot([8.2 8.5 8.8 8.85],[40 40 40 40],'ob','Markersize',Marker);
hold on


plot([0.2 0.4],[30 30],'or','Markersize',Marker);
hold on
plot([1.3 1.5 1.8],[30 30 30],'og','Markersize',Marker);
hold on
plot([2.2 2.4 2.8],[30 30 30],'ob','Markersize',Marker)
hold on
plot([3.2 3.4],[30 30],'oc','Markersize',Marker);
hold on
plot([4.5 4.56],[30 30],'om','Markersize',Marker);
hold on
plot([5.2 5.5 5.8 5.82],[30 30 30 30],'ok','Markersize',Marker)


axis([0 4*TargetNo 0 50])
set(gca,'XTick',[0 6 12 18 24],'fontweight','bold')
xlabel('Duration(h)')
set(gca, 'YTick',[] );
legend([h1 h2 h3 h4 h5 h6],'#1 F/50kg','#2 F/55kg','#3 M/60kg','#4 M/70kg','#5 M/75kg','#6 M/80kg');
% set(gca, 'XTicklabel',{'0','6','6','6','6'});