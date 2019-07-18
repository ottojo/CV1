image_gauss = im2double(imread("boats.tif"));
image = image_gauss;

n=6;

clear images_gauss;
clear images;
images_gauss{1} = image_gauss;
images{1} = image;

gauss = fspecial('gaussian', 3); % todo sigma berechnen oder auch nicht

for i = 2:n
  image_gauss = imfilter(image_gauss, gauss);
  image_gauss = 0.5 * image_gauss(1:2:end, 1:2:end) + 0.5 * image_gauss(2:2:end, 2:2:end);
  images_gauss{i} = image_gauss;

  image = 0.5 * image(1:2:end, 1:2:end) + 0.5 * image(2:2:end, 2:2:end);
  images{i} = image;
endfor

%% Visualization
close all;

figure('Name','With gaussian filtering');
for i = 1:n
  subplot(3,n/3,i);
  imshow(images_gauss{i}, []);
  colorbar();
  title(['G(' num2str(i) ')']);
endfor

figure('Name','Without gaussian filtering');
for i = 1:n
  subplot(3,n/3,i);
  imshow(images{i}, []);
  colorbar();
  title(['G(' num2str(i) ')']);
endfor
