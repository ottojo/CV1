%%
close all;
clc;
clear;

%% task a)
L = 4;          %Anzahl Messpunkte
Fs = 4;         %Sampling-Frequenz

df = Fs/L;      %Frequenzauflösung

t = [0, 0.25, 0.5, 0.75];
s = [2 3 0 1];

S = fourier(s);
stemcomplex(0:df:(Fs-df), S);
% saveas(gcf,'./images/Stemcomplex.png')

%% task b)
figure
bf = 1;
bdt = 0.01;
bt = 0:bdt:1;

by = imag(S(bf + 1)) * sin(bt * 2 * pi * bf);
plot(bt,by);
xlabel("t in seconds");
ylabel("S[1] * sin(2*pi*1Hz)");
% saveas(gcf,'./images/Sinus.png')

%% task c)
sr = ifourier(S);

%% task d)
figure
subplot(1, 3, 1);
stem(t, s);
xlabel("t in seconds");
ylabel("s[t]");
title("original signal");

subplot(1, 3, 2);
stem(0:df:(Fs-df), abs(S));
xlabel("f in Hertz");
ylabel("S[f]");
title("frequency spectrum");

subplot(1, 3, 3);
stem(t, sr);
title("reconstructed signal");
xlabel("t in seconds");
ylabel("s[t]");
% saveas(gcf,'./images/figure_d.png')

