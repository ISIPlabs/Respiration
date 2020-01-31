
normal_1 = xlsread('inputdata');
normal_2 = xlsread('inputdata');
normal_3 = xlsread('inputdata');

apnea_1 = xlsread('inputdata');
apnea_2 = xlsread('inputdata');
apnea_3 = xlsread('inputdata');

% signal synthesis---------------------------------------------------------

N_N_1 = normal_1 + normal_2;
N_N_2 = normal_1 + normal_3;
N_N_3 = normal_2 + normal_3;

A_A_1 = apnea_1 + apnea_2;
A_A_2 = apnea_1 + apnea_3;
A_A_3 = apnea_2 + apnea_3;

A_N_1 = normal_1 + apnea_1;
A_N_2 = normal_1 + apnea_2;
A_N_3 = normal_1 + apnea_3;
A_N_4 = normal_2 + apnea_1;
A_N_5 = normal_2 + apnea_2;
A_N_6 = normal_2 + apnea_3;
A_N_7 = normal_3 + apnea_1;
A_N_8 = normal_3 + apnea_2;
A_N_9 = normal_3 + apnea_3;


fs = 1e3;

t1 = 1:600; 
fs1 = length(t1); 

D = zeros(1,400);
E = zeros(1,400);
F = zeros(1,400);
    
% HPF Filtering------------------------------------------------------------

for pass = 1:400
   HPF_AA_1 = highpass(A_N_1,  pass, fs);
   HPF_AA_2 = highpass(A_N_1,  (pass+1), fs);
   
   HPF_AA_3 = highpass(A_N_2,  pass, fs);
   HPF_AA_4 = highpass(A_N_2,  (pass+1), fs);
   
   HPF_AA_5 = highpass(A_N_3,  pass, fs);
   HPF_AA_6 = highpass(A_N_3,  (pass+1), fs);
   
   % Cross-correlation-----------------------------------------------------
 
   A= corrcoef(HPF_AA_1,HPF_AA_2);
   D(1,pass) = A(1,2);
   
   B= corrcoef(HPF_AA_3,HPF_AA_4);
   E(1,pass) = B(1,2);
    
   C = corrcoef(HPF_AA_5,HPF_AA_6);
   F(1,pass) = C(1,2);
       
 % FFT Cross-correlation---------------------------------------------------
   
    S1=fft(N_N_1);
    N1=length(N_N_1);
    cutoff1=ceil(N1/2);

    P2 = abs(S1/N1);
    P1 = P2(1:cutoff1+1);
    P1(2:end-1) = 2*P1(2:end-1);

    f1 = fs1*(0:cutoff1)/N1;
    
    plot(f1,P1);

% Output-------------------------------------------------------------------    
    
    saveas(plot(f1,P1),"Output"+pass+".jpg"); 
     
    D = corrcoef(P1,P3);
    save("N_N_corelation_"+pass+".mat","E");  
end
 