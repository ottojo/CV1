function images = gaussianPyramid(image, n, useGaussian)
  clear images;
  images{1} = image;

  % TODO: Parameter für gauss bestimmen
  gauss = fspecial('gaussian');

  for i = 2:n
    if useGaussian == 1
          image = imfilter(image, gauss);
    end
    image = 0.5 * image(1:2:end, 1:2:end) + 0.5 * image(2:2:end, 2:2:end);
    images{i} = image;
  end
end
