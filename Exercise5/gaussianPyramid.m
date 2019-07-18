function images = gaussianPyramid(image, n, useGaussian)
  clear images;
  images{1} = image;

  gauss = fspecial('gaussian', 3); % todo sigma berechnen oder auch nicht

  for i = 2:n
    if useGaussian == 1
          image = imfilter(image, gauss);
    endif
    image = 0.5 * image(1:2:end, 1:2:end) + 0.5 * image(2:2:end, 2:2:end);
    images{i} = image;
  endfor
endfunction
