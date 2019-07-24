image = im2double(imread("boats.tif"));

n=6;

images_gauss = gaussianPyramid(image, n, 1);
images = gaussianPyramid(image, n, 0);

%% Visualization
close all;

figure('Name','With gaussian filtering');
for i = 1:n
  subplot(3,n/3,i);
  imshow(images_gauss{i}, []);
  colorbar();
  title(['G(' num2str(i) ')']);
end
saveas(gcf,'ex01_with.eps','epsc')

figure('Name','Without gaussian filtering');
for i = 1:n
  subplot(3,n/3,i);
  imshow(images{i}, []);
  colorbar();
  title(['G(' num2str(i) ')']);
end
saveas(gcf,'ex01_without.eps','epsc')
