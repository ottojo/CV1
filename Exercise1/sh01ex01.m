obstA = imread("obstA.png");
obstB = imread("obstB.png");
histA = myHistogram(obstA);
histB = myHistogram(obstB);

subplot(2,2,1);
imshow(obstA);
title("obstA.png");

subplot(2,2,2);
plot(histA);
xlim([0 255]);
title("Histogram: obstA");
xlabel("Pixel value");
ylabel("frequency");
text(75, 0.003, "\leftarrow Apple");
text(110, 0.019, "\leftarrow Orange");
text(150, 0.02, "\leftarrow Background");

subplot(2,2,3);
imshow(obstB);
title("obstB.png");

subplot(2,2,4);
plot(histB);
xlim([0 255]);
title("Histogram: obstB");
xlabel("Pixel value");
ylabel("frequency");
text(70, 0.007, "\leftarrow Apples");
text(145, 0.022, "\leftarrow Background");