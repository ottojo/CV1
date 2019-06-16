%% Group 2: Dominik Authaler, Jonas Otto
close all;
clc;
clear;

%% Calculation

image = im2double(rgb2gray(imread("./images/circles.png")));

% Rescale to fit exactly [0, 1]
image = image - min(image(:));
image = image ./ max(image(:));

min(image(:))
max(image(:))

%image = mat2gray(imread("./images/circles.png"));

sobelX = [1, 0, -1; 2, 0, -2; 1, 0, -1];
sobelY = [-1, -2, -1; 0, 0, 0; 1, 2, 1];

I_x = imfilter(image, sobelX, 'replicate', 'conv');
I_y = imfilter(image, sobelY, 'replicate', 'conv');

magnitude = sqrt(I_x .^2 + I_y .^2);

angles = atan2(I_y, I_x);

mag_zoomed = imcrop(magnitude, [100, 250, 50, 50]);

%% Visualization
rows = 1;
cols = 3;

subplot(rows, cols, 1);
imshow(image);
title("original image");

subplot(rows, cols, 2);
imshow(magnitude, []);
title("magnitude");

hold on;
quiver(I_x, I_y);
hold off;


subplot(rows, cols, 3);
imshow(gradientColored(magnitude, angles, 0));
title("image orientation");

figure
imshow(mag_zoomed);
title("Enlarged magnitude part");

%saveas(gcf,'./images/ex02.png')