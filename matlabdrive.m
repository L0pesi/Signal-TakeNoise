%*********************************************%
%             Trabalho Prático                %
%           Processamento de Sinal            %
%                                             %
%                                             %
%            [08390] Sérgio Lopes             %      
%            [18855] Diogo Rocha              %
%            [19255] Alexandre Carvalho       %
%                                             %
%*********************************************%


clear all
clc
load dados.mat

%------------------------------------------------------------------------------------------------------

%1º segmento - Filtro passa-baixo Chebychev

plot(seg1)                                   % Gráfico do 1º segmento original
figure                                       % Mostra o gráfico
plot(seg1_RR)                                % Gráfico do 1º segmento com ruido
figure                                       % Mostra o gráfico
trans11=abs(fft(seg1_RR));                   % Valor Absoluto da transformada de fourrier do 1º segmento com ruído
plot(trans11)                                % Gráfico da transformada
figure                                       % Mostra o gráfico
[b,a]=cheby1(4,1,10000/fs,'low');            % Criacao de um filtro Chebyshev
seg1_filtrado=filtfilt(b,a,seg1_RR);         % aplicação do filtro cheby
trans13=abs(fft(seg1_filtrado));             % Valor Absoluto da transformada de fourrier do 1º segmento filtrado
figure                                       % Mostra o gráfico
plot(trans13)                                % Gráfico da transformada
correlacao=corrcoef(seg1,seg1_filtrado)      % Correlação do 1º segmento original e do 1º segmento filtrado

%sound(seg1_filtrado,fs)                     %Teste intermédio Seg1 filtrado

%-------------------------------------------------------------------------------------------------------------------

%2º segmento - Filtro passa-baixo Chebychev

plot(seg2)                                   % Gráfico do 2º segmento original
figure                                       % Mostra o gráfico
plot(seg2_RR)                                % Gráfico do 2º segmento com ruido
figure                                       % Mostra o gráfico
trans21=abs(fft(seg2_RR));                   % Valor Absoluto da transformada de fourrier do 2º segmento com ruído
plot(trans21)                                % Gráfico da transformada
figure                                       % Mostra o gráfico
[b,a]=cheby1(4,1,10000/fs,'low');            % Criacao de um filtro Chebyshev
seg2_filtrado=filtfilt(b,a,seg2_RR);         % aplicação do filtro cheby
trans23=abs(fft(seg2_filtrado));             % Valor Absoluto da transformada de fourrier do 2º segmento filtrado
figure                                       % Mostra o gráfico
plot(trans23)                                % Gráfico da transformada
correlacao=corrcoef(seg2,seg2_filtrado)      % Correlação do 2º segmento original e do 2º segmento filtrado

%sound(seg2_filtrado,fs)                     %Teste intermédio Seg2 filtrado

%-------------------------------------------------------------------------------------------------------------------

%3º segmento - Filtro corta banda Butterworth 

plot(seg3)                                              % Gráfico do 3º segmento original
figure                                                  % Mostra o gráfico
trans31=abs(fft(seg3,fs));                              % Valor Absoluto da transformada de fourrier do seg 3 sem ruído
plot(trans31(1:fs/2));                                  % Gráfico da transformada
figure                                                  % Mostra o gráfico
trans32=abs(fft(seg3_RR,fs));                           % Valor Absoluto da transformada de fourrier do seg 3 com ruído
plot(trans32(1:fs/2));                                  % Gráfico da transformada
n1 = 3000;                                              % Definição do intervalo para o Filtro Corta
n2 = 3200;                                              % Definição do intervalo para o Filtro Corta
[b,a]=butter(4,[n1/(fs/2) n2/(fs/2)], 'stop');          % Criacao de um filtro Corta banda com frequencias de corte de n1 e n2
seg3_aux = filtfilt(b, a, seg3_RR);                     % Aplicacao do filtro gerado anteriormente
[d,c]=butter(4,[ 19000/(fs/2) (21000)/(fs/2)], 'stop'); % Criacao de um filtro Corta banda com frequencias de corte de valores teste
seg3_filtrado = filtfilt(d, c, seg3_aux);               % Aplicacao do filtro gerado anteriormente
trans33=abs(fft(seg3_filtrado,fs));                     % Transformada Fourrier do segmento filtrado
figure                                                  % Mostra o gráfico
plot(trans33(1:fs/2))                                   % Gráfico da transformada         
figure                                                  % Mostra o gráfico
plot(seg3_filtrado)                                     % Gráfico da transformada
correlacao=corrcoef(seg3,seg3_filtrado)                 % Correlação do 3º segmento original e do 3º segmento filtrado

%sound(seg3_filtrado,fs)                                %Teste intermédio Seg3 filtrado


%-----------------------------------------------------------------------------------------------------------

%4º segmento - Filtro corta banda Butterworth  

plot(seg4)                                              % Gráfico do 4º segmento original
figure                                                  % Mostra o gráfico
trans41=abs(fft(seg4,fs));                              % Valor Absoluto da transformada de fourrier do seg 4 sem ruído
plot(trans41(1:fs/2));                                  % Gráfico da transformada
figure                                                  % Mostra o gráfico
trans42=abs(fft(seg4_RR,fs));                           % Valor Absoluto da transformada de fourrier do seg 4 com ruído                      
plot(trans42(1:fs/2));                                  % Gráfico da transformada
n1 = 850;                                               % Definição do intervalo para o Filtro Corta
n2 = 1150;                                              % Definição do intervalo para o Filtro Corta
[b,a]=butter(5,[n1/(fs/2) n2/(fs/2)], 'stop');          % Criacao de um filtro Corta banda com frequencias de corte de n1 e n2
seg4_aux = filtfilt(b, a, seg4_RR);                     % Aplicacao do filtro gerado anteriormente
n3 = 3900;                                              % Definição do intervalo para o Filtro Corta
n4 = 4200;                                              % Definição do intervalo para o Filtro Corta
[d,c]=butter(5,[(n3)/(fs/2) (n4)/(fs/2)], 'stop');      % Criacao de um filtro Corta banda com frequencias de corte de n3 e n4
seg4_filtrado = filtfilt (d, c, seg4_aux);              % Aplicacao do filtro gerado anteriormente
trans43=abs(fft(seg4_filtrado,fs));                     % Transformada Fourrier do segmento filtrado             
figure                                                  % Mostra o gráfico
plot(trans43(1:fs/2))                                   % Gráfico da transformada    
figure                                                  % Mostra o gráfico
plot(seg4_filtrado)                                     % Gráfico da transformada
correlacao=corrcoef(seg4,seg4_filtrado)                 % Correlação do 4º segmento original e do 4º segmento filtrado

%sound(seg4_filtrado,fs)                                %Teste intermédio Seg4 filtrado


%-------------------------------------------------------------------------------------------------------------------

%5º segmento Filtro passa-baixo Chebychev

plot(seg5)                                   % Gráfico do 5º segmento original
figure                                       % Mostra o gráfico
plot(seg5_RR)                                % Gráfico do 5º segmento com ruido
figure                                       % Mostra o gráfico
trans51=abs(fft(seg5_RR));                   % Valor Absoluto da transformada de fourrier do 5º segmento com ruído
plot(trans51)                                % Gráfico da transformada
figure                                       % Mostra o gráfico 
[b,a]=cheby1(4,1,10000/fs,'low');            % Criacao de um filtro Chebyshev
seg5_filtrado=filtfilt(b,a,seg5_RR);         % aplicação do filtro cheby
trans53=abs(fft(seg5_filtrado));             % Valor Absoluto da transformada de fourrier do 5º segmento filtrado
figure                                       % Mostra o gráfico
plot(trans53)                                % Gráfico da transformada
correlacao=corrcoef(seg5,seg5_filtrado)      % Correlação do 5º segmento original e do 5º segmento filtrado

%sound(seg5_filtrado,fs)                     %Teste intermédio Seg5 filtrado

%-------------------------------------------------------------------------------------------------------------------

%6º segmento - Filtro corta banda Butterworth  

plot(seg6)                                                  % Gráfico do 6º segmento original
figure                                                      % Mostra o gráfico
trans61=abs(fft(seg6,fs));                                  % Valor Absoluto da transformada de fourrier do seg 6 sem ruído
plot(trans61(1:fs/2));                                      % Gráfico da transformada
figure                                                      % Mostra o gráfico
trans62=abs(fft(seg6_RR,fs));                               % Valor Absoluto da transformada de fourrier do seg 6 com ruído
plot(trans62(1:fs/2));                                      % Gráfico da transformada
n1 = 1950;                                                  % Definição do intervalo para o Filtro Corta
n2 = 2050;                                                  % Definição do intervalo para o Filtro Corta
[b,a]=butter(2,[n1/(fs/2) n2/(fs/2)], 'stop');              % Criacao de um filtro Corta banda com frequencias de corte de n1 e n2
seg6_aux = filter(b, a, seg6_RR);                           % Aplicacao do filtro gerado anteriormente
[d,c]=butter(2,[(n1+2000)/(fs/2) (n2+2000)/(fs/2)], 'stop');% Criacao de um filtro Corta banda com frequencias de corte de n1 e n2 com acrescimo em ambos
seg6_filtrado = filter(d, c, seg6_aux);                     % Aplicacao do filtro gerado anteriormente
trans63=abs(fft(seg6_filtrado,fs));                         % Transformada Fourrier do segmento filtrado  
figure                                                      % Mostra o gráfico
plot(trans63(1:fs/2))                                       % Gráfico da transformada
figure                                                      % Mostra o gráfico
plot(seg6_filtrado)                                      	% Gráfico da transformada
correlacao=corrcoef(seg6,seg6_filtrado)                     % Correlação do 6º segmento original e do 6º segmento filtrado

%sound(seg6_filtrado,fs)                                    %Teste intermédio Seg6 filtrado

%-------------------------------------------------------------------------------------------------------------------


% Resumindo e Concluindo


%se utilizassemos treaming teriamos um encadeamento melhor mas ficou assim:
filtro=[seg1_filtrado;seg2_filtrado;seg3_filtrado;seg4_filtrado;seg5_filtrado;seg6_filtrado]
%execução dos segmentos todos filtrados
sound(filtro,fs)





