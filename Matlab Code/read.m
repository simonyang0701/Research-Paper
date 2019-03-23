clc
close all
sensor1=0;
sensor2=0;
sensor3=0;
sensor4=0;
interval=200;
lowlimit=0;
uplimit=1024;
while 1
    sensor1=[sensor1 a.analogRead(0)];
    sensor2=[sensor2 a.analogRead(1)];
    sensor3=[sensor3 a.analogRead(2)];
    sensor4=[sensor4 a.analogRead(3)];
    subplot(4,1,1);
    plot(sensor1,'LineWidth',1);
    set(gca,'xlim',[length(sensor1)-interval length(sensor1)],'ylim',[lowlimit uplimit]);
    subplot(4,1,2);
    plot(sensor2,'LineWidth',1);
    set(gca,'xlim',[length(sensor2)-interval length(sensor2)],'ylim',[lowlimit uplimit]);
    subplot(4,1,3);
    plot(sensor3,'LineWidth',1);
    set(gca,'xlim',[length(sensor3)-interval length(sensor3)],'ylim',[lowlimit uplimit]);
    subplot(4,1,4);
    plot(sensor4,'LineWidth',1);
    set(gca,'xlim',[length(sensor4)-interval length(sensor4)],'ylim',[lowlimit uplimit]);
    drawnow;
    if a.analogRead(0)>0 || a.analogRead(1)>0 || a.analogRead(2)>0 || a.analogRead(3)>0
        result=1
    else
        result=0
    end
end