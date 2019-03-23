clc
close all
b = 0;
x = 0;
interval = 300;
lowlimit = 0;
uplimit = 1200;
tic

Fs = 78;                  
T = 1/Fs;    
L = length(x(9000:9700));
t = (0:L-1)*T;

while 1
        b = a.analogRead(0);
        [b1,a1]=tf(Hd); %%调用滤波器参数
        d=filter(b1,a1,b);%%滤波操作
        d = [d b];
        plot(x,'LineWidth',1.5);
        if length(d)>interval
            plot(d,'LineWidth',1.5);
            title('MZI');
            set(gca,'xlim',[length(d)-interval length(d)],'ylim',[lowlimit uplimit]);
        end
        drawnow;

end
toc

