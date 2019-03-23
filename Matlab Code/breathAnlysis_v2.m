function frequncyBreath=breathAnlysis_v2(breathData,timeDuration)
% breathData:床垫原始数据 timeDuration： 原始数据时长
global sampleRate
sampleRate=1000;

timeline = (0:1:timeDuration*sampleRate-1)/sampleRate;

figure;
subplot(2,1,1)
plot(timeline,breathData);
legend('Raw Data');
xlabel('Time(s)');
ylabel('Amplitude');

wavelet = 'dmey';  %用dmey小波分析
[C,L] = wavedec(breathData,13,wavelet);

%a12 =wrcoef('a',C,L,wavelet,13);
d13= wrcoef('d',C,L,wavelet,13);
d12= wrcoef('d',C,L,wavelet,12);
d11= wrcoef('d',C,L,wavelet,11);
%d10= wrcoef('d',C,L,wavelet,10);
%d9 = wrcoef('d',C,L,wavelet,9);
%d8 = wrcoef('d',C,L,wavelet,8);
%d7 = wrcoef('d',C,L,wavelet,7);
%d6 = wrcoef('d',C,L,wavelet,6);
%d5 = wrcoef('d',C,L,wavelet,5);
%d4 = wrcoef('d',C,L,wavelet,4);
%d3 = wrcoef('d',C,L,wavelet,3);
%d2 = wrcoef('d',C,L,wavelet,2);
%d1 = wrcoef('d',C,L,wavelet,1);
d_b=d11+d12+d13;


% MinPeakDistance = 2;-==][
 subplot(2,1,2);
 

findpeaks(zscore(d_b),timeline,'MinPeakProminence',1); %每隔一定距离寻找峰值
% title('breath display ');
legend('Breath');
xlabel('Time(s)');
ylabel('Amplitude');

[pksd_b,locsd_b]=findpeaks(zscore(d_b),timeline,'MinPeakProminence',1);

% length_locsd_b=length(locsd_b);
% frequncyBreath=length_locsd_b/timeDuration*60;
length_locsd_b=length(locsd_b); 
 for i=1:length_locsd_b-1
      distance_d_b(i)=locsd_b(i+1)-locsd_b(i);
   if(distance_d_b(i)<2.4||distance_d_b(i)>15)  %这个地方有个阈值。。。就是说一次呼吸一般在2.4~15s之间不会更快或更慢
       distance_d_b(i)=0;
          
   end
 end
  
  distance_d_b(distance_d_b==0)=[];
  period_d_b=mean(distance_d_b);
  frequncyBreath=round(60/period_d_b);


end