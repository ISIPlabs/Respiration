s = load('C:\Users\ch863\Desktop\연구실\UWB 호흡 파일\respiration\log_0110_1617.csv'); %Respiration Signal
ns = load('C:\Users\ch863\Desktop\연구실\UWB 호흡 파일\respiration\log_0207_1327.csv'); %Respiration Signal
t1 = 1:600; %신호 벡터 길이
t2 = 1:606;
fs1 = length(t1); %신호 길이
fs2 = length(t2);

% 호흡신호 FFT----------------------------------

figure(1)
plot(t1,s)

S1=fft(s);
N1=length(s);
cutoff1=ceil(N1/2);

P2 = abs(S1/N1);
P1 = P2(1:cutoff1+1);
P1(2:end-1) = 2*P1(2:end-1);

f1 = fs1*(0:cutoff1)/N1;
figure(2)
plot(f1,P1);
xlabel('Frequency')
ylabel('Amplitude')

% 무호흡 FFT------------------------------------

figure(3)
plot(t2,ns)

S2=fft(ns);
N2=length(ns);
cutoff2=ceil(N2/2);

P4 = abs(S2/N2);
P3 = P4(1:cutoff2+1);
P3(2:end-1) = 2*P3(2:end-1);

f2 = fs2*(0:cutoff2)/N2;
figure(4)
plot(f2,P3);
xlabel('Frequency')
ylabel('Amplitude')
