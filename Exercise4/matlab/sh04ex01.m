%% Group 2: Dominik Authaler, Jonas Otto
close all;
clc;
clear;

%% Reading the images, applying Moravec Operator
img = im2double(imread('../images/figures1.png'));
noisyImg = im2double(imread('../images/figures1_noisy.png'));

corners = moravec(img);
cornerNoisy = moravec(noisyImg);

%% Visualization
rows = 1;
cols = 2;

figure('name','Image');
subplot(rows, cols, 1);
imshow(img);
title("image");

subplot(rows, cols, 2);
imshow(corners);
title("detected corners");
saveas(gcf,'../images/ex01.eps','epsc')

figure('name','Noisy Image');
subplot(rows, cols, 1);
imshow(noisyImg);
title("image");

subplot(rows, cols, 2);
imshow(cornerNoisy);
title("detected corners");
saveas(gcf,'../images/ex01_noisy.eps','epsc')