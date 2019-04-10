%% 호흡 분류 프로그램
prompt = {'파일명:'}; %입력 대화상자
title = 'Input';
answer = inputdlg(prompt,title,[1 40]);
A = cell2mat(answer);

s = load("C:\Users\ch863\Desktop\연구실\호흡 파일\respiration\"+A+".csv"); %파일 경로
t1 = 1:600; %신호 벡터 길이
fs1 = length(t1); %신호 길이

%% 호흡신호 분석
figure('Name',A)
plot(t1,s)
xlabel('Time(1/10)sec')
ylabel('Amplitude')


% FFT
S1=fft(s); %FFT - 실수, 허수로 나뉘는 역할만 수행 // DFT
N1=length(s); % 600
cutoff1=ceil(N1/2); %ceil - 실수부, 허수부 개별적으로 처리

P2 = abs(S1/N1); %주파수 해석의 목적은 각 주파수 별로 크기가 어느정도인지 알아야함
P1 = P2(1:cutoff1+1); %FFT - 복소수는 켤레 복소수이기에 magnitude가 2개로 갈라진다. 이것을 합치는역할
P1(2:end-1) = 2*P1(2:end-1); 

f1 = fs1*(0:cutoff1)/N1;%600*1/2 = 300, 주파수 범위(나이퀴스트 주파수)
figure('Name',A)
plot(f1,P1);
xlabel('Frequency')
ylabel('Amplitude')

[the_max, index_of_max] = max(P1);
a = index_of_max - 1; %최대 응답의 인덱스

if (11<=a)&&(a<=16)
    f = msgbox({A;'정상호흡 입니다.'},'결과');
elseif (17<=a)&&(a<=27)
    f = msgbox({A;'비정상호흡(무호흡) 입니다.'},'결과');
elseif (2<=a)&&(a<=4)
    f = msgbox({A;'정상호흡(말하는 중) 입니다.'},'결과');
end