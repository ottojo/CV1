%% Group 2: Dominik Authaler, Jonas Otto
close all;
clc;
clear;

%% Calculation
% Reading the image in
img = im2double(imread('../images/figures1.png'));
%img = im2double(imread('../images/figures1_noisy.png'));

[height, width] = size(img);

%Sobel operators
sobelX = [1, 0, -1; 2, 0, -2; 1, 0, -1];
sobelY = [1, 2, 1; 0, 0, 0; -1, -2, -1];

I_x = imfilter(img, sobelX, 'replicate', 'conv');
I_y = imfilter(img, sobelY, 'replicate', 'conv');

magnitude = sqrt(I_x .^2 + I_y .^2);

%Gaussian filter
sigma = 3;
h = 2 * ceil(2*sigma) + 1;

G = fspecial('gaussian', h, sigma);
S11 = imfilter(I_x .* I_x, G, 'replicate', 'conv'); 
S12 = imfilter(I_x .* I_y, G, 'replicate', 'conv'); 
S22 = imfilter(I_y .* I_y, G, 'replicate', 'conv'); 

% images used to present the results
binHom = zeros(height, width, 1);
binEdge = zeros(height, width, 1);
binCorner = zeros(height, width, 1);
output = zeros(height, width, 3);
colorHom = double([135, 206, 235])./255;
colorEdge = double([0, 255, 0])./255;
colorCorner = double([255, 0, 0])./255;

eigThreshold = 0.1;

sEigenValues = zeros(height, width, 2); % 2 eigenvalues at every location
sFirstEigenVectors = zeros(height, width, 2); % one eigenvector with 2 components at every location

%TODO find a solution without these for-loops
for y = 1:height
    for x = 1:width     
        S = [S11(y, x), S12(y, x); S12(y, x), S22(y, x)];
        [V, D] = eig(S);
        
        [eig_values, perm] = sort(diag(D), 'descend'); % Sorted eigenvalues, permutation vector of indices
        eig_vectors = V(:, perm);                      % Sorted eigenvectors
        
        sEigenValues(y, x, :) = eig_values;
        %Classify pixel
        if eig_values(1) < eigThreshold && eig_values(2) < eigThreshold 
            binHom(y, x) = 1;
            output(y, x,:) = colorHom;
        else        
            sFirstEigenVectors(y, x, :) = eig_vectors(:, 1);
            
            if eig_values(2) > eigThreshold
                binCorner(y, x) = 1;
                output(y, x,:) = colorCorner;
            else 
                binEdge(y, x) = 1;
                output(y,x,:) = colorEdge;
            end
        end
    end
end

%% Visualization
rows = 3;
cols = 3;

subplot(rows, cols, 1);
imshow(img);
title("image");

subplot(rows, cols, 2);
imshow(magnitude);
title("magnitude");

subplot(rows, cols, 3);
imshow(output);
title("detected structures");

subplot(rows, cols, 4);
imshow(binHom);
title("homogenous");

subplot(rows, cols, 5);
imshow(binEdge);
title("edges");

subplot(rows, cols, 6);
imshow(binCorner);
title("corners");

roiX = 190:210;
roiY = 40:60;

subplot(rows, cols, 7);
imshow(img(roiY, roiX),[]);
hold on;
quiver(sFirstEigenVectors(roiY, roiX, 1),sFirstEigenVectors(roiY, roiX, 2));
title("first eigen vector");

subplot(rows, cols, 8);
imshow(sEigenValues(:, :, 1), []);
title("first eigen value");
subplot(rows, cols, 9);
imshow(sEigenValues(:, :, 2), []);
title("second eigen value");
saveas(gcf,'../images/ex02.eps','epsc')