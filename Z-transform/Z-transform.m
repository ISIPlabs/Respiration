%% 레지스터 초기화

clear all 
close all
%% 초기값 설정

pole = [1 -1.5 0.5]; % 극점=분모
zero = [1 0 0]; % 영점=분자
z= -1 : 0.1 : 1; % z의 범위, 그래프 x축 설정 
%% Polynomial root calculate

poleroots=roots(pole); 
zeroroots=roots(zero); 
figure(1); 
zplane(zero,pole); 
title('z-plane'); xlabel('Real'); ylabel('Image');
%% Check roots

polevalue=polyval(pole,z); 
zerovalue=polyval(zero,z); 
figure(2); 
subplot(2,1,1); 
plot(z, polevalue);
title('분모,극점');
subplot(2,1,2); 
plot(z, zerovalue);
title('분자,영점');
%% - Frequency, phase feature

figure(3); 
[H,w]=freqz(zero,pole,100); 
%% Frequency feature

magH=abs(H); 
subplot(2,1,1); 
plot(w/pi,magH); 
title('magnitude response'); xlabel('freq. in pi unit'); ylabel('magnitude');
%% phase feature

phaH=angle(H); 
subplot(2,1,2); 
plot(w/pi,phaH/pi); 
title('phase response'); xlabel('freq. in pi unit'); ylabel('phase in pi unit');
%% Main

[zero1,pole1,lenth1] = residuez(apnea,normal);
[zero2,pole2,lenth2] = residuez(normal,apnea);

zplane(zero1,pole1);
zplane(zero2,pole2);
