image = im2double(imread('boats.tif'));
n = 6;
G = gaussianPyramid(image, n, 1);

for i = 1:n
  % calc L{i}
  if i ~= n
    L{i} = G{i} - imresize(G{i+1}, 2);
    else
      L{i} = G{i};
    endif
endfor

%% Plot L
figure('Name', 'Laplacian Pyramid');
for i = 1:n
  subplot(3,n/3,i);
  imshow(L{i}, []);
  colorbar();
  title(['L(' num2str(i) ')']);
endfor