close all
clear
clc 



off = csvread ('TFZ_Off.CSVV', 1 ,0);
bm = csvread ('TFZ_BYM.CSV', 1 ,0);
sit = csvread ('TFZ_SIT.CSV', 1 ,0);
on = csvread ('TFZ_OnBed.CSV', 1 ,0);

OFF = off(4:4:300000);
BM = bm(4:4:300000);
SIT = sit(4:4:300000);
ON = on(4:4:300000);

start = 50000;
stop = start+500;
interval = 2;

OFF_Select = OFF(start:interval:stop);
BM_Select = BM(start:interval:stop);
SIT_Select = SIT(start:interval:stop);
ON_Select = ON(start:interval:stop);


y_axis_down = 100;
y_axis_up = 1024;


plot(SIT_Select)
axis([0 length(start:interval:stop) y_axis_down y_axis_up])
set(gca,'XTickLabel',{'0','1','2','3','4','5'}) ;




