%% =================================================================
%  Actividad 1 - Ingenieria de Comunicaciones 2

%  Don't run the whole code. Every section is used to answer a specific 
%  question (check pdf).
%  So, RUN IT BY SECTIONS, eg, only Q2.a, Only Q2.b and so on 
%  (the end of every section is the start of other)
% =================================================================

%% Q2.a) Señal senoidal
clc, clear;
fs = 40;             % Frecuencia de muestreo
t = [0:1/(fs):2];    % Intervalo de t
f = 2;               % frecuencia en Hz
G = 1;               % Ampltud
y = G*sin(2*pi*f*t); % Señal

axis([0 2 -G G]);
plot(t,y);            % Grafica de la Señal

%% Q2.b) Cuantizacion Ideal (Ancho de pulso = 0)
clc, clear;
fs = 40;             % Frecuencia de muestreo
t = [0:1/(fs):2];    % Intervalo de t
f = 2;               % frecuencia en Hz
G = 1;               % Ampltud
axis([0 2 -G G]);    % Ejes

y = G*sin(2*pi*f*t); % Señal
stem(t,y);           % Señal con ancho de pulso 0

%% Q2.c)  Cuantizacion Real (Ancho de pulso distinto a 0)
clc, clear;
fs = 40;             % Frecuencia de muestreo
t = [0:0.0001:2];    % Intervalo de t
d = [0:1/(fs):2];    % Cuantizacion basado en a frec de muestreo
f = 2;               % frecuencia en Hz
G = 1;               % Ampltud
axis([0 2 -G G]);    % Ejes

y = G*sin(2*pi*f*t); % Señal
h = pulstran(t,d,'rectpuls',0.01); % Función tren de pulsos unitarios
sampling = h.*y;     % Muestreo
plot(t,sampling,t,y);% Señal con ancho de pulso distint de 0

%% Q3  Cuantizacion Real (Ancho de pulso distinto a 0)
clc, clear;
fs = 20;             % Frecuencia de muestreo
t = [0:0.0001:3];    % Intervalo de t
d = [0:1/(fs):3];    % Cuantizacion basado en a frec de muestreo
f = 1;               % frecuencia de la señal
G = 1;               % Ampltud
axis([0 2 -G G]);    % Ejes

y = G*pulstran(t,d,'tripuls',1)-1;

%% Q4.a) SEÑAL TRIANGULAR CONTINUA
clear, clc;
fs = 20;             % Frecuencia de muestreo  
t = [0:0.001:3];     % Intervalo de t
d = [0:1:3];         % Cuantizacion basado en a frec de muestreo
G = 1;               % Amplitud
y = 2*G*pulstran(t,d,'tripuls',1)-1; % Señal triangular
plot (t,y);           % Grafica de la señal continua

%% Q4.b) SEÑAL TRIANGULAR CUANTIZADA
clear, clc;
fs = 20;             % Frecuencia de muestreo  
t = [0:0.001:3];     % Intervalo de t
d = [0:1:3];         % frec de señal
G = 1;               % Ampltud
y = 2*G*pulstran(t,d,'tripuls',1)-1;

e = [0:1/(fs):3];      % Cuantizacion basado en frec de muestreo   
h = pulstran(t,e,'rectpuls',0.01); % Tren de pulsos unitarios
sampling = h.*y;       % Muestreo
plot(t,sampling,t,y)   % Señal cuantizada

%% Q5.a) SEÑAL DIGITAL CONTINUA
clear, clc;
fs = 20;             % Frecuencia de muestreo  
t = [0:0.001:12];    % Intervalo de t
G = 1;               % Ampltud

y = G*square(t);     % Señal digital
plot(t,y,'LineWidth',3); % Grafica de señal digital

%% Q5.b) SEÑAL DIGITAL CUANTIZADA
clear, clc;
fs = 20;             % Frecuencia de muestreo  
t = [0:0.001:12];    % Intervalo de t
G = 1;               % Ampltud

y = G*square(t);     % Señal digital
e = [0:1/(fs):12];   % Cuantizacion basado en frec de muestreo   
h = pulstran(t,e,'rectpuls',0.01); % Tren de pulsos unitarios
sampling = h.*y;     % Muestreo
plot(t,sampling,t,y);% Señal cuantizada

%%  Q6.a) SUMA DE 2 SEÑALES SENOIDALES CON DISTINTA FRECUENCIA
clear, clc;
t = [0:0.001:1];      % Intervalo de t
f1 = 10;              % Frecuencia de la señal 1
f2 = 20;              % Frecuencia de la señal 2
G = 1;                % Amplitud de las señales

x = G*sin(2*pi*f1*t); % Señal 1
y = G*sin(2*pi*f2*t); % Señal 2 
z = x+y;              % Resultante

plot(t,z);

%% Q6.b) SUMA DE 2 SEÑALES SENOIDALES CON DISTINTA FRECUENCIA
% SEÑAL CUANTIZADA
clear, clc;
fs = 100;             % Frecuencia de muestreo
t = [0:0.001:1];      % Intervalo de t
f1 = 10;              % Frecuencia de la señal 1
f2 = 20;              % Frecuencia de la señal 2
G = 1;                % Amplitud de las señales

x = G*sin(2*pi*f1*t); % Señal 1
y = G*sin(2*pi*f2*t); % Señal 2
z = x+y;              % Resultante

d = [0:1/(fs):1];    % Cuantizacion basado en frec de muestreo   
h = pulstran(t,d,'rectpuls',0.001); % Tren de pulsos unitarios
sampling = h.*z;     % Muestreo
plot(t,sampling,t,z);% Señal cuantizada


%% Q7 SEÑAL SAMPLING
G = 1;
t = [-2*G:0.001:2*G];      % Intervalo de t
y = sinc(t);

grid on;
plot(t,y);

%% Q8 GRAFICA DE LA SEÑAL BINARIA
clc, clear;

% Señal binaria en bits
x = [1 0 1 1 0 1 1 0];   
% Ancho de pulso de cada bit
ap  = 200e-6;                                                     

% Grafica de la señal binaria
bit=[]; 
for n=1:1:length(x)
    if x(n)==1
        se=ones(1,100);
    elseif x(n)==0
        se=zeros(1,100);
    end
    bit=[bit se];
end

t = ap /100: ap /100: 100*length(x)*(ap /100);
plot(t,bit,'lineWidth',2.5);
grid on;
axis([ 0 ap *length(x) -2 2]);

ylabel('Amplitud(volt)');
xlabel(' Tiempo(sec)');
title('Senal Binaria');

% CALCULO DE LA VELOCIDAD BINARIA
vb = 1/ap;
X = sprintf('La velocidad binaria es %d bps',vb);
disp(X)

% CALCULO DEL ANCHO DE BANDA DE LA SEÑAL
bw = 8*vb;
Y = sprintf('La señal tiene 8 bits, entonces el ancho de banda sera %d bps',bw);
disp(Y);



















