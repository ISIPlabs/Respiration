s = load('C:\Users\ch863\Desktop\������\��ȣ���\ȣ���ȣ������.txt'); %ȣ��
ns = load('C:\Users\ch863\Desktop\������\��ȣ���\��ȣ���ȣ������.txt'); %��ȣ��
t = 1:120;

breathSignal = s + imnoise(s,'gaussian', 0.15); %ȣ���ȣ + ���������
nobreathSignal = ns + imnoise(ns, 'gaussian', 0.15); %��ȣ���ȣ + ���������
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
medianBreathSignal = medfilt1(breathSignal,3); %ȣ���ȣ �߰�������(���� 3)
medianNobreathSignal = medfilt1(nobreathSignal,3); %��ȣ���ȣ �߰�������(���� 3)

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
breathSignal = s + imnoise(s,'gaussian', 0.15); %ȣ���ȣ + ���������
nobreathSignal = ns + imnoise(ns, 'gaussian', 0.15); %��ȣ���ȣ + ���������

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