%% Group 2: Dominik Authaler, Jonas Otto
close all;
clc;
clear;

%% Calculation
image = im2double(rgb2gray(imread("./images/circles.png")));

% Rescale to fit exactly [0, 1]
image = image - min(image(:));
image = image ./ max(image(:));

%min(image(:))
%max(image(:))

sobelX = [1, 0, -1; 2, 0, -2; 1, 0, -1];
sobelY = [1, 2, 1; 0, 0, 0; -1, -2, -1];

I_x = imfilter(image, sobelX, 'replicate', 'conv');
I_y = imfilter(image, sobelY, 'replicate', 'conv');

magnitude = sqrt(I_x .^2 + I_y .^2);

angles = atan2(I_y, I_x);

rX = 110:120;
rY = 270:280;

%% Visualization
rows = 1;
cols = 3;

subplot(rows, cols, 1);
imshow(image);
title("original image");

subplot(rows, cols, 2);
imshow(magnitude(rY, rX), []);
title("magnitude and direction");
hold on;
quiver(I_x(rY, rX), I_y(rY, rX), 1);
hold off;

subplot(rows, cols, 3);
imshow(gradientColored(magnitude, angles, 0.25));
title("image orientation");
tightfig;
%saveas(gcf,'./images/ex02.eps','epsc')