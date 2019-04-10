%% ȣ�� �з� ���α׷�
prompt = {'���ϸ�:'}; %�Է� ��ȭ����
title = 'Input';
answer = inputdlg(prompt,title,[1 40]);
A = cell2mat(answer);

s = load("C:\Users\ch863\Desktop\������\ȣ�� ����\respiration\"+A+".csv"); %���� ���
t1 = 1:600; %��ȣ ���� ����
fs1 = length(t1); %��ȣ ����

%% ȣ���ȣ �м�
figure('Name',A)
plot(t1,s)
xlabel('Time(1/10)sec')
ylabel('Amplitude')


% FFT
S1=fft(s); %FFT - �Ǽ�, ����� ������ ���Ҹ� ���� // DFT
N1=length(s); % 600
cutoff1=ceil(N1/2); %ceil - �Ǽ���, ����� ���������� ó��

P2 = abs(S1/N1); %���ļ� �ؼ��� ������ �� ���ļ� ���� ũ�Ⱑ ����������� �˾ƾ���
P1 = P2(1:cutoff1+1); %FFT - ���Ҽ��� �ӷ� ���Ҽ��̱⿡ magnitude�� 2���� ��������. �̰��� ��ġ�¿���
P1(2:end-1) = 2*P1(2:end-1); 

f1 = fs1*(0:cutoff1)/N1;%600*1/2 = 300, ���ļ� ����(��������Ʈ ���ļ�)
figure('Name',A)
plot(f1,P1);
xlabel('Frequency')
ylabel('Amplitude')

[the_max, index_of_max] = max(P1);
a = index_of_max - 1; %�ִ� ������ �ε���

if (11<=a)&&(a<=16)
    f = msgbox({A;'����ȣ�� �Դϴ�.'},'���');
elseif (17<=a)&&(a<=27)
    f = msgbox({A;'������ȣ��(��ȣ��) �Դϴ�.'},'���');
elseif (2<=a)&&(a<=4)
    f = msgbox({A;'����ȣ��(���ϴ� ��) �Դϴ�.'},'���');
end