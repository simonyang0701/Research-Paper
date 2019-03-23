function [frequncyHeartbeat,frequncy_h]=heartbeatAnlysis(heartbeat, pulseWave, timeDuration)
% heartbeat ：床垫数据  pulseWave：ppg原始数据  timeDuration：数据时长
% 这个程序分别用床垫信号和夹指信号分析心率，当然，夹指数据更准确。。。。所以是一个参考
global sampleRate
sampleRate=1000;


timeline = (0:1:timeDuration*sampleRate-1)/sampleRate;


% plot_h=plot_h+1

wavelet = 'dmey';
[C,L] = wavedec(heartbeat,13,wavelet);
%a12 =wrcoef('a',C,L,wavelet,13);
%d13= wrcoef('d',C,L,wavelet,13);
%d12= wrcoef('d',C,L,wavelet,12);
%d11= wrcoef('d',C,L,wavelet,11);
%d10= wrcoef('d',C,L,wavelet,10);
d9 = wrcoef('d',C,L,wavelet,9);
d8 = wrcoef('d',C,L,wavelet,8);
%d7 = wrcoef('d',C,L,wavelet,7);
%d6 = wrcoef('d',C,L,wavelet,6);
%d5 = wrcoef('d',C,L,wavelet,5);
%d4 = wrcoef('d',C,L,wavelet,4);
%d3 = wrcoef('d',C,L,wavelet,3);
%d2 = wrcoef('d',C,L,wavelet,2);
%d1 = wrcoef('d',C,L,wavelet,1);


fftResulth = fft(zscore(pulseWave));% 这里还是用了一个fft的，为了确定心率的大致频率，以确定寻找峰值的间距
fftResulth = abs(fftResulth);
% fftxb = (0:interval*sampleRate-1)/interval;
% [Mb,Ih]=max(fftResulth);
% Ih=Ih-1;
max_fh=fftResulth(0.8*timeDuration);

Ih=0.8*timeDuration;
for j=0.8*timeDuration:2*timeDuration
    if (fftResulth(j)>max_fh)
        max_fh=fftResulth(j);
        Ih=j;
    end
    
    
end
Ih=Ih-1;

MinPeakDistance = timeDuration/(Ih+4);

findpeaks(zscore(d8),timeline,'MinPeakDistance',MinPeakDistance);

[pksd8,locsd8]=findpeaks(zscore(d8),timeline,'MinPeakDistance',MinPeakDistance);

MinPeakDistance_p = timeDuration/(Ih+4);

findpeaks(zscore(pulseWave),timeline,'MinPeakDistance',MinPeakDistance_p);

[pksp,locsp]=findpeaks(zscore(pulseWave),timeline,'MinPeakDistance',MinPeakDistance_p);

length_locsp=length(locsp);
for i=1:length_locsp-1
    distance_p(i)=locsp(i+1)-locsp(i);
   if(distance_p(i)<0.5||distance_p(i)>1.2) 
       distance_p(i)=0;
   end
end
  distance_p(distance_p==0)=[];
  period_p=mean(distance_p);
  frequncy_h=round(60/period_p);
  
  
 length_locsd8=length(locsd8); 
  for i=1:length_locsd8-1
      distance_d8(i)=locsd8(i+1)-locsd8(i);
   if(distance_d8(i)<0.5||distance_d8(i)>1.2) 
       distance_d8(i)=0;
      
      
  end
  
distance_d8(distance_d8==0)=[];
  period_d8=mean(distance_d8);
  frequncyHeartbeat=round(60/period_d8);



end