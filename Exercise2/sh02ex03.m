%%
close all;
clc;
clear;

%% task a)
im1 = im2double(imread('./images/flower01.png'));
im2 = im2double(imread('./images/flower02.png'));

figure(1)
subplot(2, 2, 1);
imshow(im1)
title('flower01.png');

subplot(2, 2, 2);
imshow(im2)
title('flower01.png');

F1 = fft2(im1);
F2 = fft2(im2);

% 
% subplot(2, 2, 3);
% imagesc(log(abs(fftshift(F1))));
% colorbar;
% title('Frequency spectrum of flower01.png');
% 
% subplot(2, 2, 4);
% imagesc(log(abs(fftshift(F2))));
% colorbar;
% title('Frequency spectrum of flower02.png');
% saveas(gcf,'./images/ex03_1.png')

%% task b)
[height, width, dim] = size(im1);
sigma = height / 2; %Images have same sizes
hsize = 2*ceil(2*sigma)+1;
G = fspecial('gaussian', hsize, sigma);
G = G ./ max(max(G));
H = 1 - G;

figure(2)
imagesc(H);
colorbar;
title('Highpass filter');
saveas(gcf,'./images/ex03_2.png')

%% task c)
% calculate fft of filter
H_fft = fft(H);

filtered1 = imfilter(im1, H, 'replicate', 'conv');
HF1 = fft(filtered1);

figure(1)
subplot(2, 2, 3);
imagesc(log(abs(fftshift(HF1))));
colorbar;
title('Frequency spectrum of flower01.png');

subplot(2, 2, 4);
imagesc(log(abs(fftshift(F2))));
colorbar;
title('Frequency spectrum of flower02.png');
%saveas(gcf,'./images/ex03_1.png')
