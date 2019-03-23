n=1;
interval=100;
y=abs(diff(x,n));
sample=x(1:1,1:interval);
j=5;
length=interval-2*j;
total=22623;
len=fix(total/interval);
answer=zeros(1,len);
result=zeros(1,length);

for i=1:len
    sample=x(1:1,interval*(i-1)+1:interval*i);
    result=zeros(1,length);
    for t=1:length
        result(1,t)=abs(sample(1,t+2*j)-2*sample(1,t+j)+sample(1,t));
        t=t+1;
    end
    answer(1,i)=sum(result);
    i=i+1;
end
% figure(1);
% subplot(3,1,1);
% plot(x);
% subplot(3,1,2);
% plot(answer);
% subplot(3,1,3);
% plot(y);
% figure(2);
% plot(answer);
display=zeros(1,len);
for i=2:len-1
    if answer(1,i)<1800 && answer(1,i-1)<1800 && answer(1,i+1)<1800
        display(i)=1;
    else
        display(i)=2;
    end
end
figure(3);
subplot(2,1,1);
plot(x);
subplot(2,1,2);
plot(display);