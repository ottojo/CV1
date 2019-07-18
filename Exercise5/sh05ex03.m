clear;

image = im2double(imread('basket.jpg'));

orientations = [0, pi/2, pi/4];
frequencies = [0.64, 0.32, 0.08];

b = 2.32;

for f = frequencies
  for theta = orientations
    % b = f * sigma = const
    Gabors{end+1} = getGabor(f, b/f, theta);
  endfor
endfor

energy = zeros(1,length(Gabors));
for k = 1:length(Gabors)
  energy(k) = sqrt(sum(sum(abs(imfilter(image, Gabors{k}).^2))));
endfor

close all;
figure();
axis auto;
subplot(1,3,1);
bar(orientations, energy(1:3));
title('f = 0,64');
ylim([min(energy), max(energy)]);

subplot(1,3,2);
bar(orientations, energy(4:6));
title('f = 0,32');
ylim([min(energy), max(energy)]);


subplot(1,3,3);
bar(orientations, energy(7:9));
title('f = 0,08');
ylim([min(energy), max(energy)]);
