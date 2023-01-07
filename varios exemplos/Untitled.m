
clear all
clc
load dados.mat

%1º segmento

plot(seg1)
figure
plot(seg1_RR)
figure
transa1=abs(fft(seg1_RR));
plot(transa1)
figure
transa2=abs(fft(seg1_RR));
plot(transa2)
[b,a]=cheby1(4,1,10000/fs,'low');

seg1_filtrado=filtfilt(b,a,seg1_RR);
transa3=abs(fft(seg1_filtrado));
figure
plot(trans3)
correlacao=corrcoef(seg1,seg1_filtrado)



%2º segmento

plot(seg2)
figure
plot(seg2_RR)
figure
trans2=abs(fft(seg2_RR));
plot(trans2)
figure
trans2=abs(fft(seg2_RR));
plot(trans2)
[b,a]=cheby1(4,1,10000/fs,'low');

seg2_filtrado=filtfilt(b,a,seg2_RR);
trans4=abs(fft(seg2_filtrado));
figure
plot(trans4)
correlacao=corrcoef(seg2,seg2_filtrado)

sound(seg2_filtrado,fs)


