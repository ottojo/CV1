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
  endif
endfor

%% Plot L
close all;
figure('Name', 'Laplacian Pyramid');
for i = 1:n
  subplot(3,n/3,i);
  imshow(L{i}, []);
  colorbar();
  title(['L(' num2str(i) ')']);
endfor


% Reset G
clear G;

% Reconstruct image from L
figure('Name', 'Reconstructed Image from L');
imshow(reconstruct(L),[]);

% Compression
lambda = 0.2;
for i = 1:n-1
  L{i}(abs(L{i}) < lambda * max(max(abs(L{i})))) = 0;
endfor

%% Plot L
figure('Name', 'Laplacian Pyramid after Compression');
for i = 1:n
  subplot(3,n/3,i);
  imshow(L{i}, []);
  colorbar();
  title(['L(' num2str(i) ')']);
endfor


% Reset G
clear G;

% Reconstruct image from L
figure('Name', 'Reconstructed Image from L after Compression');
imshow(reconstruct(L),[]);