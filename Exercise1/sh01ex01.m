obstA = imread("obstA.png");
obstB = imread("obstB.png");
histA = myHistogram(obstA);
histB = myHistogram(obstB);

subplot(4,2,1);
imshow(obstA);
title("obstA.png");

subplot(4,2,2);
plot(histA);
xlim([0 255]);
title("Histogram: obstA");
xlabel("Pixel value");
ylabel("frequency");
text(75, 0.003, "\leftarrow Apple");
text(110, 0.019, "\leftarrow Orange");
text(150, 0.02, "\leftarrow Background");

subplot(4,2,3);
imshow(obstB);
title("obstB.png");

subplot(4,2,4);
plot(histB);
xlim([0 255]);
title("Histogram: obstB");
xlabel("Pixel value");
ylabel("frequency");
text(70, 0.007, "\leftarrow Apples");
text(145, 0.022, "\leftarrow Background");


subplot(4,2,5);
plot(obstA(50,:));
title("obstA row 50");

subplot(4,2,6);
plot(obstA(200,:));
title("obstA row 200");

subplot(4,2,7);
plot(obstB(50,:));
title("obstB row 50");

subplot(4,2,8);
plot(obstB(200,:));
title("obstB row 200");

set(gcf, 'Position', [100 100 1000 800])
