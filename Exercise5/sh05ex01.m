image = im2double(imread("boats.tif"));

n=6;
clear images;
images{1} = image;
gauss = fspecial('gaussian', 3); % todo sigma berechnen oder auch nicht

for i = 2:n
  image = imfilter(image, gauss);
  % TODO: ist das der passende binomialdingsbums?
  image = 0.5 * image(1:2:end, 1:2:end) + 0.5 * image(2:2:end, 2:2:end);
  images{i} = image;
endfor

%% Visualization
clf;
for i = 1:n
  subplot(3,n/3,i);
  imshow(images{i}, []);
  colorbar();
endfor
