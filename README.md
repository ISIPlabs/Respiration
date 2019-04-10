# Respiration


사용기법

FFT.m


FFT를 사용하여 주파수 도메인에서의 호흡 신호와 무호흡 신호를 분류할 수 있는 프로그램이다.



상호상관.m


cross-correlation을 사용하여 시간 도메인에서의 호흡 신호와 무호흡 신호를 분류할 수 있는 프로그램이다.


사용방법


FFT.m 파일은 호흡 파일 경로를 지정한 후, 호흡 파일의 벡터만큼 수정한다.
상호상관.m 파일은 호흡 파일 경로를 지정한 후, 실행한다.

---------------------------------------------------------------------------------------------------------------
Copyright (c) 2019, Suyeol. Kim, Chaehwan Hwang, Ceholhyeong Park, Jisu Kim and Deokwoo Lee All rights reserved.

Respiration Signal Analysis Program

by Suyeol Kim, Chaehwan Hwang and Deokwoo Lee, 2019

This program is a collection of Matlab function implementing

estimation and classification of respiratory status using UWB radar device.

It may requires some functions contained in https://github.com/ISIPlabs/Respiration 

by the same authors and Cheolhyeong Park and Jisu Kim. 

Reference papers:

Sooyeol Kim, Chaehwan Hwang, Ju O Kim, Cheolhyeong Park and *Deokwoo Lee, Application to Detection and Classification of Respiratory Status based on a Signal Correlation, Autumn Annual Conference of IEIE, 2018
