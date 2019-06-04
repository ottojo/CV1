%%
close all;
clc;
clear;

%%
im = im2double(imread('./images/lena.tif'));

%max(max(image)) = 0.9412 
%min(min(image)) = 0.1176 --> values in [0, 1]

sigma = 3;
hsize = 2*ceil(2*sigma)+1
G = fspecial('gaussian', hsize, sigma);
H = [-1, -2, 0; -2, 0, 2; 0, 2, 1];

imG = imfilter(im, G, 'replicate', 'conv');
imR1 = imfilter(imG, H, 'replicate', 'conv');

imH = imfilter(im, H, 'replicate', 'conv');
imR2 = imfilter(imH, G, 'replicate', 'conv');

subplot(3,3,1);
imshow(im);
title("lena.tiff");

subplot(3,3,2);
imshow(imG);
title("Gauss");

subplot(3,3,3);
imshow(imR1);
title("R1 = I*G*H");

subplot(3,3,4);
imshow(im);
title("lena.tiff");

subplot(3,3,5);
imshow(imH);
title("Filter H");

subplot(3,3,6);
imshow(imR2);
title("R2 = I*H*G");

imDiff = abs(imR1-imR2);
subplot(3,3,8);
imshow(imDiff);
title("|R1 - R2|");

display("Summe über diff: ");
display(sum(sum(imDiff)));

%% Save images for use in PDF
% imwrite(im, './images/lena.png');
% imwrite(imH, './images/imH.png');
% imwrite(imG, './images/imG.png');
% imwrite(imR1, './images/imR1.png');
% imwrite(imR2, './images/imR2.png');
% imwrite(imDiff, './images/imDiff.png');
