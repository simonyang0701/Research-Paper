
close all
clc
clear


filename_1 = strcat('W000',num2str(0),'.CSV');%FP
filename_2 = strcat('W000',num2str(2),'.CSV');%DFB
filename_3 = strcat('W000',num2str(1),'.CSV');%MZI

Data{1,1} = csvread(filename_1,29,0);
Data{1,2} = csvread(filename_2,34,0);
Data{1,3} = csvread(filename_3,29,0);

Wavelength_1(:,1) = Data{1,1}(:,1);
Wavelength_2(:,1) = Data{1,2}(:,1);
Wavelength_3(:,1) = Data{1,3}(:,1);

Spec_1(:,1) = Data{1,1}(:,2);
Spec_2(:,1) = Data{1,2}(:,2);
Spec_3(:,1) = Data{1,3}(:,2);

Spec_3s = smooth(Spec_3);

% figure
% line(Wavelength_1,Spec_1,'Color','r','linewidth',1.5)
% ax1 = gca;
% ax1.XColor = 'k';
% ax1.YColor = 'k';
% xlabel('Wavelength(nm)')
% ylabel('Intensity(dBm)')
% hold on
% line(Wavelength_2,Spec_2,'Color','b','linewidth',1.5)
% axis([Wavelength_1(1651) Wavelength_1(2651) -43 -10]);
% grid on
% legend('FP Laser','DFB Laser')
% 
% 
% ax1_pos = ax1.Position;
% ax2 = axes('Position',ax1_pos,...
%     'XAxisLocation','top',...
%     'YAxisLocation','right',...
%     'Color','none');
% line(Wavelength_3,Spec_3s,'Parent',ax2,'Color','k','linewidth',1.5)
% ax2.XColor = 'k';
% ax2.YColor = 'k';
% axis([Wavelength_3(8501) Wavelength_3(10001) -15 0])
% % xlabel('Wavelength(nm)')
% ylabel('Transmission(dB)')
% legend('Mach-Zehnder Interferometer')



figure(1)
plot(Wavelength_1,Spec_1,'r','linewidth',2)
hold on
plot(Wavelength_2,Spec_2,'b','linewidth',2)
xlabel('Wavelength(nm)')
ylabel('Intensity(dBm)')
% axis([Wavelength_1(1501) Wavelength_1(2001) -75 -10]);
axis([Wavelength_1(1) Wavelength_1(length(Wavelength_1)) -90 0]);
grid on

figure(2)
plot(Wavelength_3,Spec_3,'k','linewidth',2)
axis([Wavelength_3(7501) Wavelength_3(10001) -20 0])