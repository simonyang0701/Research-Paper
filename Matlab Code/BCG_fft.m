clc
clear all
close all

load BCGForFFT.mat

Fs = 1000;
BCG_selected = BCG(4000:19000);
BCG_filtered = Lowpass_getDCandJ(Fs,BCG_selected,13);
BCG_filtered_selected = BCG_filtered(2100:14000);

[f,P] = fft_func(Fs,BCG_filtered_selected);


figure(1)
plot(BCG_filtered_selected)

figure(2)
plot(f,P,'linewidth',2)
axis([0 5 0 8])
grid on
set(gca,'FontSize',10);
ylabel('Amplitude')
xlabel('Frequence(Hz)')
set(gcf,'unit','centimeters','position',[0 5 10 8]);