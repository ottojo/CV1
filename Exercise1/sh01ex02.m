img = im2double(imread('lena.tif'));
imgNoise = im2double(imread('lenaNoise.tif'));

subplot(2,2,1);
imshow(img);
title("lena.tif");

subplot(2,2,2);
imshow(imgNoise);
title("lenaNoise.tif");

% Normalizing the image intensity if necessary
if max(max(img)) > 1 
    display('Normalizing needed');
    imgN = img / max(max(img));
    imgNoiseN = imgNoise / max(max(imgNoise));
end

H = ones(15);
H = H / numel(H);

imgF = imfilter(img, H);
imgNoiseF = imfilter(imgNoise, H);

subplot(2,2,3);
imshow(imgF);
title("Filtered lena.tif");

subplot(2,2,4);
imshow(imgNoiseF);
title("Filtered lenaNoise.tif");


