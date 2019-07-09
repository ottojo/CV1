close all;

figure();
imshow(img,[]);
hold on;
quiver(sFirstEigenVectors(:, :, 1),sFirstEigenVectors(:, :, 2));

figure();
subplot(2, 1, 1);
imshow(sEigenValues(:, :, 1), []);
subplot(2, 1, 2);
imshow(sEigenValues(:, :, 2), []);
