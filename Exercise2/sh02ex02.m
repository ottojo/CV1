image = im2double(imread("lena.tif"));

clf();

sigma = 3;
gaussianFilter = fspecial('gaussian', 2*ceil(2*sigma)+1, sigma);
H = [[-1, -2, 0]; [-2, 0, 2]; [0, 2, 1]];

r1 = imfilter(imfilter(image, gaussianFilter, 'replicate', 'conv'), H, 'replicate', 'conv');
r2 = imfilter(imfilter(image, H, 'replicate', 'conv'), gaussianFilter, 'replicate', 'conv');

subplot(3,1,1);
title("R1");
imshow(r1);

subplot(3,1,2);
imshow(r2);

subplot(3,1,3);
imshow(abs(r1-r2));

sum(sum(abs(r1-r2))) % = 31 != 0