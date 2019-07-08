function corners = moravec(img)

[height, width] = size(img)

%Matrices used to calculate the differences between two neighboored pixels
%in the given direction
D0 = [0, 0, 0; 0, 1, -1; 0, 0, 0];
D45 = [0, 0, 0; 0, 1, 0; 0, 0, -1];
D90 = [0, 0, 0; 0, 1, 0; 0, -1, 0];
D135 = [0, 0, 0; 0, 1, 0; -1, 0, 0];

%Box filter for the 5x5 neighborhood
B = ones(5, 5) * 1/25;

%Apply both filters
imgD0 = imfilter(imfilter(img, D0, 'replicate').^2, B, 'replicate');
imgD45 = imfilter(imfilter(img, D45, 'replicate').^2, B, 'replicate');
imgD90 = imfilter(imfilter(img, D90, 'replicate').^2, B, 'replicate');
imgD135 = imfilter(imfilter(img, D135, 'replicate').^2, B, 'replicate');

%Normalize results
sum = imgD0 + imgD45 + imgD90 + imgD135;
imgD0 = imgD0 ./ sum;
imgD45 = imgD45 ./ sum;
imgD90 = imgD90 ./ sum;
imgD135 = imgD135 ./ sum;

min12 = min(imgD0, imgD45);
min34 = min(imgD90, imgD135);
min_ges = min(min12, min34);

%correct nan-values occuring inside the figures because the summed value
%(divisor) is zero
min_ges(isnan(min_ges)) = 0;

% Find corners:
% Corner is indicated by minimum > threshold
threshold = 0.1;
corners = zeros(height, width);
corners(min_ges > threshold) = 1;