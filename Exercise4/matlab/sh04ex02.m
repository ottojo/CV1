pkg load image

img = im2double(imread('../images/figures1.png'));
ix = imfilter(img, fspecial('sobel'), 'replicate');
iy = imfilter(img, transpose(fspecial('sobel')), 'replicate');

[height, width] = size(img)

i_abs = sqrt(ix.^2 + iy.^2);

subplot(2,1,1);
imshow(img);
subplot(2,1,2);
imshow(i_abs,[]);

sigma = 3;
g = fspecial('gaussian', 2 * ceil(2 * sigma) + 1, sigma);

% TODO: For each location (ix, iy scalar)

sEigenValues = zeros(height, width, 2); % 2 eigenvalues at every location
sFirstEigenVectors = zeros(height, width, 2); % one eigenvector with 2 components at every location

% TODO: dont use for loop
for x = [1:height]
  for y = [1:width]
    YY = iy(x, y).^2;
    XX = ix(x, y).^2;
    XY = ix(x, y).*iy(x, y);

    XX=conv2(XX, g, 'same');
    XY=conv2(XY, g, 'same');
    YY=conv2(YY, g, 'same');

    S = [XX XY; XY YY];
    [V, D]= eig(S);                      % Eigenvectors, diagonal matrix
    [d, ind] = sort(diag(D), 'descend'); % Sorted eigenvalues, permutation vector of indices
    Vs = V(:, ind);                      % Sorted eigenvectors
    
    sEigenValues(x, y, :) = d;
    if d(1) > 0.0002
          sFirstEigenVectors(x, y, :) = Vs(:, 1);
    endif
  endfor
endfor
