%% Group 2: Dominik Authaler, Jonas Otto
close all;
clc;
clear;

%% Calculation
image = imread("./images/bookstore_dark.tif");

histogram = myHistogram(image);

cumulativeHistogram = cumsum(histogram);

equalizedImage = intlut(image, uint8(cumulativeHistogram*256));

%% Visualization
rows = 3;
cols = 2;

subplot(rows, cols, 1);
imshow(image);
title("Input Image");

subplot(rows, cols, 2);
imshow(equalizedImage);
title("Equalized Image");

subplot(rows, cols, 3);
bar(0:255, histogram);
title("Histogram");

subplot(rows, cols, 4);
bar(0:255, myHistogram(equalizedImage));
title("Histogram");

subplot(rows, cols, 5);
bar(0:255, cumulativeHistogram);
title("Cumulative Histogram");

subplot(rows, cols, 6);
bar(0:255, cumsum(myHistogram(equalizedImage)));
title("Cumulative Histogram");

%saveas(gcf,'./images/ex01.eps', 'epsc')