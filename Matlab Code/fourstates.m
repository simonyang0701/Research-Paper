close all
clear
clc 



off = csvread ('TFZ_Off.CSV', 1 ,0);
bm = csvread ('TFZ_BYM.CSV', 1 ,0);
sit = csvread ('TFZ_SIT.CSV', 1 ,0);
on = csvread ('TFZ_OnBed.CSV', 1 ,0);

OFF = off(4:4:300000);
BM = bm(4:4:300000);
SIT = sit(4:4:300000);
ON = on(4:4:300000);

for i = 1:200
    
start = 40000+90*i;
stop = start+4000;
interval = 2;

OFF_Select = OFF(start:interval:stop);
BM_Select = BM(start:interval:stop);
SIT_Select = SIT(start:interval:stop);
ON_Select = ON(start:interval:stop);


y_axis_down = 0;
y_axis_up = 800;

subplot(4,1,1)
plot(SIT_Select)
axis([0 length(start:interval:stop) y_axis_down y_axis_up])
set(gca,'XTickLabel',{'0','1','2','3','4','5','6','7','8','9','10'}) ;
grid on


subplot(4,1,2)
plot(BM_Select)
axis([0 length(start:interval:stop) y_axis_down y_axis_up])
set(gca,'XTickLabel',{'0','1','2','3','4','5','6','7','8','9','10'}) ;
grid on
ylabel('Intensity(a.u.)')


subplot(4,1,3)
plot(ON_Select)
axis([0 length(start:interval:stop) y_axis_down y_axis_up])
set(gca,'XTickLabel',{'0','1','2','3','4','5','6','7','8','9','10'}) ;
grid on


subplot(4,1,4)
plot(OFF_Select)
axis([0 length(start:interval:stop) y_axis_down y_axis_up])
set(gca,'XTickLabel',{'0','1','2','3','4','5','6','7','8','9','10'}) ;
grid on
xlabel('Time(s)')

pause
end
