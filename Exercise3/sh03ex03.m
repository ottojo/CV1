%% Group 2: Dominik Authaler, Jonas Otto
close all;
clc;
clear;

%% Load .mat files and calculate
load("./images/Hfreq.mat");
load("./images/Hfreq2.mat");
load("./images/filtered.mat");

Hspat = ifft2(Hfreq);
Hspat2 = ifft2(Hfreq2);

orgImage = imread("./images/bookstore.tif");
filteredFreq = fft2(filtered);

deconvolved1 = ifft2(filteredFreq ./ Hfreq);
deconvolved2 = ifft2(filteredFreq ./ Hfreq2);

%% Visualization
rows = 2;
cols = 2;

figure()
subplot(rows, cols, 1);
imshow(log(abs(fftshift(Hfreq)) + 1), []);
title("filter 1 (frequency domain)");

subplot(rows, cols, 2);
imshow(fftshift(log(abs(Hfreq2) + 1)), []);
title("filter 2 (frequency domain)");

subplot(rows, cols, 3);
imshow(Hspat(1:30, 1:50), []);
title("filter 1 (spatial domain)");

subplot(rows, cols, 4);
imshow(Hspat2(1:30, 1:50), []);
title("filter 2 (spatial domain)");
saveas(gcf,'./images/ex03_filters.eps','epsc')

figure()
subplot(rows, cols, 1);
imshow(orgImage);
title("original image");

subplot(rows, cols, 2)
imshow(filtered);
title("filtered image");

subplot(rows, cols, 3);
imshow(deconvolved1);
title("deconvolved image (filter 1)");

subplot(rows, cols, 4)
imshow(deconvolved2);
title("deconvolved image (filter 2)");
%saveas(gcf,'./images/ex03_images.eps','epsc');

