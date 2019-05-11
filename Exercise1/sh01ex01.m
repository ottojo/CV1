obstA = imread("obstA.png");
obstB = imread("obstB.png");
histA = myHistogram(obstA);
histB = myHistogram(obstB);

subplot(2,2,1);
imshow(obstA);
title("obstA.png");

subplot(2,2,2);
plot(x, histA);
xlim([0 255]);
title("Histogram: obstA");
xlabel("Pixel value");
ylabel("frequency");

subplot(2,2,3);
imshow(obstB);
title("obstB.png");


subplot(2,2,4);
plot(x, histB);
xlim([0 255]);
title("Histogram: obstB");
xlabel("Pixel value");
ylabel("frequency");
