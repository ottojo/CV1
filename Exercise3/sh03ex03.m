%% Group 2: Dominik Authaler, Jonas Otto
close all;
clc;
clear;

%% Load .mat files
load("./images/Hfreq.mat");
load("./images/Hfreq2.mat");
load("./images/filtered.mat");

h = abs(ifft(Hfreq));

h_zoomed = imcrop(h, [1, 1, 30, 50]);

orgImage = imread("./images/bookstore.tif");

%% Visualization
rows = 4;
cols = 2;

subplot(rows, cols, 1);
imshow(filtered);
title("Filtered image");

subplot(rows, cols, 2);
imshow(orgImage);
title("Original image");

subplot(rows, cols, 3);
imshow(log(abs(fftshift(Hfreq)) + 1), []);          % Darstellung ist nicht wie im Beispielbild auf dem Aufgabenblatt ?!
title("Hfreq (frequency domain)");

subplot(rows, cols, 4);
imshow(fftshift(log(abs(Hfreq2) + 1)), []);          % Darstellung ist nicht wie im Beispielbild auf dem Aufgabenblatt ?!
title("Hfreq2 (frequency domain)");

subplot(rows, cols, 5);
imshow(h_zoomed, []);
title("Hfreq (spatial domain)");
