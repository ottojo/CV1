function H = myHistogram(im)
%MYHISTOGRAM
% im: 2D-matrix representing image values in [0, 255]
% H: size(H) = [1, 256] (each entry representing normed
% frequency of corresponding gray value in "im")
% Begin here; profi tip: check with assert(cond, msg) if
% the input im is indeed an image with the defined
% intensity range

% Check input bounds
assert(min(min(im)) >= 0 & max(max(im)) <= 255);

H = zeros(1, 256);

for k = 1:numel(im)
    H(im(k)+1) = H(im(k)+1)+1;
end

% Normalize
H = H/numel(im);
end
