clear all
clc
load dados.mat

%1º segmento

plot(seg1)                                   % Gráfico do 1º segmento original
figure                                       % Mostra o gráfico
plot(seg1_RR)                                % Gráfico do 1º segmento com ruido
figure                                       % Mostra o gráfico
trans11=abs(fft(seg1_RR));                   % Valor Absoluto da transformada de fourrier do 1º segmento com ruído
plot(trans11)                                % Gráfico da transformada
figure                                       % Mostra o gráfico
trans12=abs(fft(seg1_RR));         %igual ao trans11????
plot(trans12)                      %igual ao trans11????
[b,a]=cheby1(4,1,10000/fs,'low');            % cheby

seg1_filtrado=filtfilt(b,a,seg1_RR);         % aplicação do filtro cheby
trans13=abs(fft(seg1_filtrado));             % Valor Absoluto da transformada de fourrier do 1º segmento filtrado
figure                                       % Mostra o gráfico
plot(trans13)                                % Gráfico da transformada
correlacao=corrcoef(seg1,seg1_filtrado)      % Correlação do 1º segmento original e do primeiro segmento filtrado

%sound(seg1_filtrado,fs)     %esta perfeitinha!! mesmo!!!


%2º segmento

plot(seg2)                                   % Gráfico do 1º segmento original
figure                                       % Mostra o gráfico
plot(seg2_RR)                                % Gráfico do 1º segmento com ruido
figure                                       % Mostra o gráfico
trans21=abs(fft(seg2_RR));                   %
plot(trans21)                                % Gráfico da transformada
figure                                       % Mostra o gráfico
trans22=abs(fft(seg2_RR));                   % 
plot(trans22)                                % Gráfico da transformada
[b,a]=cheby1(4,1,10000/fs,'low');            % cheby

seg2_filtrado=filtfilt(b,a,seg2_RR);
trans23=abs(fft(seg2_filtrado));
figure
plot(trans23)
correlacao=corrcoef(seg2,seg2_filtrado)

%sound(seg2_filtrado,fs)             %ta baixinha mas boa


%3º segmento

plot(seg3)
figure
plot(seg3_RR)
figure
trans31=abs(fft(seg3_RR));
plot(trans31)
figure
trans32=abs(fft(seg3_RR));
plot(trans32)
[b,a]=cheby2(4,1,10000/fs,'low');

seg3_filtrado=filtfilt(b,a,seg3_RR);
trans33=abs(fft(seg3_filtrado));
figure
plot(trans33)
correlacao=corrcoef(seg3,seg3_filtrado)

sound(seg3_filtrado,fs)            %esta riscou o disco



%4º segmento

plot(seg4)
figure
plot(seg4_RR)
figure
trans41=abs(fft(seg4_RR));
plot(trans41)
figure
trans42=abs(fft(seg4_RR));
plot(trans42)
[b,a]=cheby1(4,1,10000/fs,'low');

seg4_filtrado=filtfilt(b,a,seg4_RR);
trans43=abs(fft(seg4_filtrado));
figure
plot(trans43)
correlacao=corrcoef(seg4,seg4_filtrado)

%sound(seg4_filtrado,fs)        %esta tem ruido


%5º segmento

plot(seg5)
figure
plot(seg5_RR)
figure
trans51=abs(fft(seg5_RR));
plot(trans51)
figure
trans52=abs(fft(seg5_RR));
plot(trans52)
[b,a]=cheby1(4,1,10000/fs,'low');

seg5_filtrado=filtfilt(b,a,seg5_RR);
trans53=abs(fft(seg5_filtrado));
figure
plot(trans53)
correlacao=corrcoef(seg5,seg5_filtrado)

%sound(seg5_filtrado,fs)       %tá memo boa esta


%6º segmento

plot(seg6)
figure
plot(seg6_RR)
figure
trans61=abs(fft(seg6_RR));
plot(trans61)
figure
trans62=abs(fft(seg6_RR));
plot(trans62)
[b,a]=cheby1(4,1,10000/fs,'low');

seg6_filtrado=filtfilt(b,a,seg6_RR);
trans63=abs(fft(seg6_filtrado));
figure
plot(trans63)
correlacao=corrcoef(seg6,seg6_filtrado)

%sound(seg6_filtrado,fs)       %CARAGO!!! Timpanos estourados!!!



% Resumindo e Concluindo

%filtro=[seg1_filtrado;seg2_filtrado]
%sound(filtro,fs)




%MUSICA=[seg1;seg2;seg3;seg4;seg5;seg6]
%FILTRADA= seg1_filtrado(1:441000) + seg2_filtrado(1:441000) + seg3_filtrado(1:441000) + seg4_filtrado(1:441000) + seg5_filtrado(1:441000)+ seg6_filtrado(1:441000);

%sound(MUSICA,fs)
%sound(FILTRADA,fs)

