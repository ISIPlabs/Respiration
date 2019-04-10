s = load('C:\Users\ch863\Desktop\연구실\상호상관\호흡신호데이터.txt'); %호흡
ns = load('C:\Users\ch863\Desktop\연구실\상호상관\무호흡신호데이터.txt'); %무호흡
t = 1:120;

breathSignal = s + imnoise(s,'gaussian', 0.15); %호흡신호 + 백색노이즈
nobreathSignal = ns + imnoise(ns, 'gaussian', 0.15); %무호흡신호 + 백색노이즈
%% SG-Filter
sSavitzkyGolay = sgolayfilt(breathSignal,5,11); %Respiration SavitzkyGolay filter
nsSavitzkyGolay = sgolayfilt(nobreathSignal,5,11); %Apenea SavitzkyGolay filter

figure(1)
plot(t,breathSignal)
axis([0,120,2.0,2.55]);
xlabel('Time[6*sec]');
ylabel('Volume[V]');
legend('Respiration signal')

figure(2)
plot(t,sSavitzkyGolay)
axis([0,120,2.0,2.55]);
xlabel('Time[6*sec]');
ylabel('Volume[V]');
legend('SavitzkyGolay filter')
%% Median Filter
medianBreathSignal = medfilt1(breathSignal,3); %호흡신호 중간값필터(차수 3)
medianNobreathSignal = medfilt1(nobreathSignal,3); %무호흡신호 중간값필터(차수 3)

figure(3)
plot(t,breathSignal)
axis([0,120,2.0,2.55]);
xlabel('Time[6*sec]');
ylabel('Volume[V]');
legend('Respiration signal')

figure(4)
plot(t,medianBreathSignal)
axis([0,120,2.0,2.55]);
xlabel('Time[6*sec]');
ylabel('Volume[V]');
legend('Median filter')
%% SG+Median Filter
breathSignal = s + imnoise(s,'gaussian', 0.15); %호흡신호 + 백색노이즈
nobreathSignal = ns + imnoise(ns, 'gaussian', 0.15); %무호흡신호 + 백색노이즈

respirationSM = medfilt1(sSavitzkyGolay,3); %Respiration SavitzkyGolay+Median Filter
apeneaSM = medfilt1(nsSavitzkyGolay,3); %Apenea SavitzkyGolay+Medain Filter

figure(5)
plot(t,breathSignal)
axis([0,120,2.0,2.55]);
xlabel('Time[6*sec]');
ylabel('Volume[V]');
legend('respiration signal')

figure(6)
plot(t,respirationSM)
axis([0,120,2.0,2.55]);
xlabel('Time[6*sec]');
ylabel('Volume[V]');
legend('SavitzkyGolay+Median filter')

figure(7)
plot(t,nobreathSignal)
axis([0,120,2.0,2.55]);
xlabel('Time[6*sec]');
ylabel('Volume[V]');
legend('Apenea signal')

figure(8)
plot(t,apeneaSM)
axis([0,120,2.0,2.55]);
xlabel('Time[6*sec]');
ylabel('Volume[V]');
legend('SavitzkyGolay+Median filter')