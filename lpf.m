signal = ecg1;
fs=length(signal)-1;
t=0:1:fs;
% low pass filter remove frequence above 750

d = fdesign.lowpass(1,3,0.5,40,fs);
h = design(d);
newsignal=filter(h,signal);
%plot
%plot(t,newsignal);
%set(gca,'xLim',[100 900],'yLim',[400 600]);
doubletosingle1=newsignal;
plot(newsignal);
%% period from 5024 to 5981, 958 length, peak to peak
%% select the 4th heartbeat as refered sample,from (-453) to (+504) the peak is 3101
%% select the 5th heartbeat as refered sample,from (-453) to (+504) the peak is 4065
%% select the 6th heartbeat as refered sample,from (-453) to (+504) the peak is 5042
%% select the 7th heartbeat as refered sample,from (-453) to (+504) the peak is 5961
%% select the 8th heartbeat as refered sample,from (-453) to (+504) the peak is 6927
%% select the 9th heartbeat as refered sample,from (-453) to (+504) the peak is 7861
%% select the 10th heartbeat as refered sample,from 8341 to 9298 the peak is 8794
%% select the 11th heartbeat as refered sample,from (-453) to (+504) the peak is 9722
%% select the 12th heartbeat as refered sample,from (-453) to (+504) the peak is 10646
%% select the 13th heartbeat as refered sample,from (-453) to (+504) the peak is 11575
%% select the 14th heartbeat as refered sample,from (-453) to (+504) the peak is 12513
%% select the 15th heartbeat as refered sample,from (-453) to (+504) the peak is 13447
%% select the 16th heartbeat as refered sample,from (-453) to (+504) the peak is 14381
%% select the 17th heartbeat as refered sample,from (-453) to (+504) the peak is 15320
%% select the 18th heartbeat as refered sample,from (-453) to (+504) the peak is 16269
%% select the 19th heartbeat as refered sample,from (-453) to (+504) the peak is 17216
%% select the 20th heartbeat as refered sample,from (-453) to (+504) the peak is 18157

%% select the 4th mzi as refered sample,from (-453) to (+504) the peak is 3082
%% select the 5th mzi as refered sample,from (-453) to (+504) the peak is 4044
%% select the 6th mzi as refered sample,from (-453) to (+504) the peak is 5007
%% select the 7th mzi as refered sample,from (-453) to (+504) the peak is 5964
%% select the 8th mzi as refered sample,from (-453) to (+504) the peak is 6907
%% select the 9th mzi as refered sample,from (-453) to (+504) the peak is 7843
%% select the 10th mzi as refered sample,from 8341 to 9298 the peak is 8776
%% select the 11th mzi as refered sample,from (-453) to (+504) the peak is 9703
%% select the 12th mzi as refered sample,from (-453) to (+504) the peak is 10627
%% select the 13th mzi as refered sample,from (-453) to (+504) the peak is 11556
%% select the 14th mzi as refered sample,from (-453) to (+504) the peak is 12494
%% select the 15th mzi as refered sample,from (-453) to (+504) the peak is 13427
%% select the 16th mzi as refered sample,from (-453) to (+504) the peak is 14362
%% select the 17th mzi as refered sample,from (-453) to (+504) the peak is 15301
%% select the 18th mzi as refered sample,from (-453) to (+504) the peak is 16253
%% select the 19th mzi as refered sample,from (-453) to (+504) the peak is 17200
%% select the 20th mzi as refered sample,from (-453) to (+504) the peak is 18139

% input1=mz1(period1(1,1):period1(2,1));
% input2=mz1(period1(1,2):period1(2,2));
% input3=mz1(period1(1,3):period1(2,3));
% input4=mz1(period1(1,4):period1(2,4));
% input5=mz1(period1(1,5):period1(2,5));
% input6=mz1(period1(1,6):period1(2,6));
% input7=mz1(period1(1,7):period1(2,7));
% input8=mz1(period1(1,8):period1(2,8));
% input9=mz1(period1(1,9):period1(2,9));
% input10=mz1(period1(1,10):period1(2,10));
% input11=mz1(period1(1,11):period1(2,11));
% input12=mz1(period1(1,12):period1(2,12));
% input13=mz1(period1(1,13):period1(2,13));
% input14=mz1(period1(1,14):period1(2,14));
% input15=mz1(period1(1,15):period1(2,15));
% input16=mz1(period1(1,16):period1(2,16));
% input17=mz1(period1(1,17):period1(2,17));