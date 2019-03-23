

rawData = Data;%rawData������ԭʼ���� 
sampleRate = 195;
interval = 5;%interval��ÿ�����ж�һ��
lengthR=length(rawData);
timeline = (1:1:lengthR)/sampleRate;
section_n=floor(lengthR/sampleRate/interval);
timeline_section = interval*(1:section_n);
timeline_section_result = zeros(1,length(timeline));
%% Wavelet analysis
for i=0:section_n-1
    
n=i;
data1Sec = rawData(interval*sampleRate*n+1:interval*sampleRate*(n+1));
data1Sec_map=data1Sec.';
[data1Sec_map, PS]=mapminmax(data1Sec_map,0,1);  

 quantityMarker=zeros(1,10);
 
 %�������ݵ�ʱ��ֲ� 
for ii=1:length(data1Sec_map)
    
   if(data1Sec_map(ii)>=0.9)
       quantityMarker(10)=quantityMarker(10)+1;
   elseif (data1Sec_map(ii)>=0.8&&data1Sec_map(ii)<0.9)
       quantityMarker(9)=quantityMarker(9)+1;
   elseif (data1Sec_map(ii)>=0.7&&data1Sec_map(ii)<0.8)
       quantityMarker(8)=quantityMarker(8)+1;  
   elseif (data1Sec_map(ii)>=0.6&&data1Sec_map(ii)<0.7)
       quantityMarker(7)=quantityMarker(7)+1;
   elseif (data1Sec_map(ii)>=0.5&&data1Sec_map(ii)<0.6)
       quantityMarker(6)=quantityMarker(6)+1;
   elseif (data1Sec_map(ii)>=0.4&&data1Sec_map(ii)<0.5)
       quantityMarker(5)=quantityMarker(5)+1;
   elseif (data1Sec_map(ii)>=0.3&&data1Sec_map(ii)<0.4)
       quantityMarker(4)=quantityMarker(4)+1;
   elseif (data1Sec_map(ii)>=0.2&&data1Sec_map(ii)<0.3)
       quantityMarker(3)=quantityMarker(3)+1;
   elseif (data1Sec_map(ii)>=0.1&&data1Sec_map(ii)<0.2)
       quantityMarker(2)=quantityMarker(2)+1;
   elseif (data1Sec_map(ii)>=0&&data1Sec_map(ii)<0.1)
       quantityMarker(1)=quantityMarker(1)+1;
     
   end
   
end

   small5=quantityMarker(1:5);
   big5=quantityMarker(6:10);

   %������ͨ��С����������Ƶ�ʻ���
   wavelet = 'dmey';
    [C,L] = wavedec(data1Sec_map,13,wavelet);
    a13 = wrcoef('a',C,L,wavelet,13);
    d13 = wrcoef('d',C,L,wavelet,13);
    d12 = wrcoef('d',C,L,wavelet,12);
    d11 = wrcoef('d',C,L,wavelet,11);
    d10 = wrcoef('d',C,L,wavelet,10);
    d9 = wrcoef('d',C,L,wavelet,9);
    d8 = wrcoef('d',C,L,wavelet,8);
    d7 = wrcoef('d',C,L,wavelet,7);
    d6 = wrcoef('d',C,L,wavelet,6);
    d5 = wrcoef('d',C,L,wavelet,5);
    d4 = wrcoef('d',C,L,wavelet,4);
    d3 = wrcoef('d',C,L,wavelet,3);
    d2 = wrcoef('d',C,L,wavelet,2);
    d1 = wrcoef('d',C,L,wavelet,1);

     power6=sum(d5.^2);

%  if ((max(small5)==quantityMarker(1)&&max(big5)==quantityMarker(10)&&quantityMarker(1)>=70&&quantityMarker(10)>=70)||(quantityMarker(1)>=100&&quantityMarker(10)>=100))
     if (max(small5)==quantityMarker(1)&&max(big5)==quantityMarker(10)&&quantityMarker(1)>=70&&quantityMarker(10)>=70)   
      %���ȸ���ʱ��ֲ��ж��Ƿ�����嶯
        state_display(i+1)=1;  %1Ϊ�嶯
    elseif (power6<1)  
    %�ٸ��ݲ�ͬƵ�ʶε���������ȷ���Ƿ�����
         state_display(i+1)=0;  %0Ϊ����   
    else
       state_display(i+1)=2;   %2Ϊ���������嶯
     end

end
 
for j = 1:length(state_display)
    timeline_section_result(((j-1)*interval*sampleRate+1):(j*interval*sampleRate)) = state_display(j)*ones(1,interval*sampleRate);
end
%% Figure
subplot(2,1,1)
plot(timeline,rawData)
subplot(2,1,2)
plot(timeline,timeline_section_result)
title('1-Movement-------0-OFF------- 2-ON')
