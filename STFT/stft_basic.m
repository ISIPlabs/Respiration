%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project : STFT
% Explanation : STFT 를 이용한 시간에따라 변하는 호흡신호 및 무호흡신호 분석
% CopyRight : MILab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Signal Init.
x = load('C:\Users\Suyeol\Desktop\새 폴더\2.txt');
y = load('C:\Users\Suyeol\Desktop\apena_STFT\log_0207_1637_602.txt');
fs = 10;
%% SET PARAMETERS for STFT
R = 60;                % R: window length   
window = hamming(R);   % hamming window, length R
N = 2^16;              % N: FFT resolution
L = ceil(R*0.5);       % L: number of non-overlap samples
overlap = R - L;       % Overlap = 50% of window length
%% RESPIRATION SPECTROGRAM
[s f t] = spectrogram(x,window,overlap,N,fs,'yaxis');

figure(4), clf
imagesc(t,f,log10(abs(s)));
colormap(jet)
axis xy
xlabel('time(sec)')
ylabel('frequency(Hz)')
title('SPECTROGRAM')
colorbar
%% APNEA SPECTROGRAM
[s1 f1 t1] = spectrogram(y,window,overlap,N,fs,'yaxis');

figure(5), clf
imagesc(t1,f1,log10(abs(s1)));
colormap(jet)
axis xy
xlabel('time(sec)')
ylabel('frequency(Hz)')
title('SPECTROGRAM')
colorbar
%% Figure Mesh-Grid_Respiration
[X,Y] = meshgrid(t,f);    % Meshgrid 생성
Z = log10(abs(s));

figure(6);
set(gcf,'color',[1 1 1]);
meshc(X,Y,Z);             % Mesh 그래프 표시
title('Total Frequency Mesh-Grid')
xlabel('time(sec)')
ylabel('frequency(Hz)')
zlabel('Amplitude')
colorbar
%% Figure Mesh-Grid_Apnea
[X1,Y1] = meshgrid(t1,f1);    % Meshgrid 생성
Z1 = log10(abs(s1));

figure(7);
set(gcf,'color',[1 1 1]);
meshc(X1,Y1,Z1);    % Mesh 그래프 표시
title('Total Frequency Mesh-Grid')
xlabel('time(sec)')
ylabel('frequency(Hz)')
zlabel('Amplitude')
colorbar