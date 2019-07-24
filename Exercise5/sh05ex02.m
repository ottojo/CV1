image = im2double(imread('boats.tif'));
n = 6;
G = gaussianPyramid(image, n, 1);

% Calculate Laplacian Pyramid
for i = 1:n
  % calc L{i}
  if i ~= n
    L{i} = G{i} - imresize(G{i+1}, 2);
  else
    L{i} = G{i};
  end
end

%% Plot L
close all;
figure('Name', 'Laplacian Pyramid');
for i = 1:n
  subplot(3,n/3,i);
  imshow(L{i}, []);
  colorbar();
  title(['L(' num2str(i) ')']);
end
saveas(gcf,'ex02_pyramid.eps','epsc')


% Reset G
clear G;

% Reconstruct image from L
figure('Name', 'Reconstructed Image from L');
imshow(reconstruct(L),[]);
saveas(gcf,'ex02_reconstructed.eps','epsc')

% Compression
lambda = 0.2;
for i = 1:n-1
  L{i}(abs(L{i}) < lambda * max(max(abs(L{i})))) = 0;
end

%% Plot L
figure('Name', 'Laplacian Pyramid after Compression');
for i = 1:n
  subplot(3,n/3,i);
  imshow(L{i}, []);
  colorbar();
  title(['L(' num2str(i) ')']);
end
saveas(gcf,'ex02_pyr_compress.eps','epsc')


% Reset G
clear G;

% Reconstruct image from L
figure('Name', 'Reconstructed Image from L after Compression');
imshow(reconstruct(L),[]);
saveas(gcf,'ex02_rec_compress.eps','epsc')

lambda = 0:0.05:0.3
error = zeros(1, size(lambda,2));

for i = 1:size(lambda,2)
  LT = L;
  for k = 1:n-1
    LT{k}(abs(LT{k}) < lambda(i) * max(max(abs(LT{k})))) = 0;
  end
  error(i) = immse(image, reconstruct(LT));
end

figure('Name', 'Error');
plot(lambda, error)
saveas(gcf,'ex02_error.eps','epsc')