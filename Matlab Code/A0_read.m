clc
close all
x=0;
y=0;
z=0;
b=0;
c=0;
d=0;
interval=200;
uplimit=1024;
lowlimit=0;
period=50;
pastsum=0;
pastx=0;
pasty=0;
pastz=0;
time=200;
result=0;
xmean=0;
ymean=0;
zmean=0;
sit=0;
side=0;



while 1
%         b = a.analogRead(0);
%         x = [x b];
%         c = a.analogRead(1);
%         y = [y c];
%         d = a.analogRead(2);
%         z = [z d];
%         subplot(1,3,1);
%         if length(x)>interval
%             plot(x,'LineWidth',1.5);
%             title('A0.BLUE.Bottom.x');
%              set(gca,'xlim',[length(x)-interval length(x)],'ylim',[lowlimit uplimit]);
%         end
%         subplot(1,3,2);   
%         if length(y)>interval
%             plot(y,'LineWidth',1.5);
%             title('A1.ORANGE.Middle');
%              set(gca,'xlim',[length(y)-interval length(y)],'ylim',[lowlimit uplimit]);
%         end
%         subplot(1,3,3);
%         if length(z)>interval
%             plot(z,'LineWidth',1.5);
%             title('A2.GREEN.Top');
%              set(gca,'xlim',[length(z)-interval length(z)],'ylim',[lowlimit uplimit]);
%         end
%         drawnow;
        t=0;
        data1=0;
        data2=0;
        data3=0;
        while t<time
            b = a.analogRead(0);
            data1 = [data1 b];
            c = a.analogRead(1);
            data2 = [data2 c];
            d = a.analogRead(2);
            data3 = [data3 d];
            t=t+1;
        end
         xmean=mean(data1)
         ymean=mean(data2)
         zmean=mean(data3)
        if (mean(data1)<390 || mean(data2)<160 || mean(data3)<695) && (mean(data1)+mean(data2)+mean(data3))<1200
            result =2
        else
            result =1
        end
        if (mean(data1)>360 || mean(data3)>670) && mean(data2)<60 && result ==2
            sit = 2
        end
        if (mean(data1)+mean(data2)+mean(data3))>1100 && result ==2
            side = 2
        end
%         if mean(data1)+mean(data2)+mean(data3)<1060 &&result=1
%             result=2
%         end
%         if mean(data1)>pastx && mean(data2)>pasty && mean(data3)>pastz &&
%         result=2
%             result=1
%         end 
%         pastx=mean(data1);
%         pasty=mean(data2);
%         pastz=mean(data3);
end