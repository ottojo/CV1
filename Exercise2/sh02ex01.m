image = im2double(imread("lena.tif"));

subplot(3,1,1);
imshow(image);

sigma = 3;
gaussianFilter = fspecial('gaussian', 2*ceil(2*sigma)+1, sigma);

blurredImage = imfilter(image, gaussianFilter, 'replicate', 'conv');

subplot(3,1,2);
imshow(blurredImage);

H = [[-1, -2, 0]; [-2, 0, 2]; [0, 2, 1]];

filteredImage = imfilter(blurredImage, H, 'replicate', 'conv');

subplot(3,1,3);
imshow(filteredImage);