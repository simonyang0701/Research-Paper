close all
clc
clear all

%%

Fs = 2000;
t = (1:Fs)/Fs;
ff1 = 100;
ff2 = 400;
x = sin(2*pi*ff1*t)+sin(2*pi*ff2*t);

y = Highpass_filter(Fs,x,350,300,0.1,40);

%%
[ f1,P1] = fft_func(Fs,x);
[ f2,P2] = fft_func(Fs,y);

%%
figure(1)
plot(t,x)
figure(2)
plot(f1,P1)
figure(3)
plot(t,y)
figure(4)
plot(f2,P2)

