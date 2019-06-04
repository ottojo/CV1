% Dominik Authaler
% Jonas Otto

%%
pkg load image;
close all;
clc;
clear;

%% task a)
im1 = im2double(imread('./images/flower01.png'));
im2 = im2double(imread('./images/flower02.png'));

F1 = fftshift(fft2(im1));
F2 = fftshift(fft2(im2));

%% task b)
[height, width, dim] = size(im1);
sigma = height / 2; %Images have same sizes
hsize = min([width,height]);
G = imresize(fspecial('gaussian', hsize, sigma), [height width]);
G = G / max(max(G));
H = 1 - G;

imagesc(H);
colorbar;
title('Highpass filter');
saveas(gcf,'./images/ex03_2.png');

F1 = F1 .* H;
F2 = F2 .* H;

%% task c)

F1S = F1 .* F1;
F2S = F2 .* F2;

energy1 = abs(sum(sum(F1S)))
energy2 = abs(sum(sum(F2S)))

figure();
subplot(2,2,1);
imshow(im1);

subplot(2,2,2);
imshow(im2);

subplot(2, 2, 3);
imshow(log(abs(F1)));
title(['Frequency spectrum of flower01.png (e =' num2str(energy1,'%d') ')']);

subplot(2, 2, 4);
imshow(log(abs(F2)));
title(['Frequency spectrum of flower02.png (e =' num2str(energy2,'%d') ')']);
saveas(gcf,'./images/ex03_1.png')
