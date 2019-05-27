% Task 2: DFT b), c)
% Implementation of DFT: fourier.m
% Implementation of inverse DFT: ifourier.m
s = [2 3 0 1];            % Input signal
S = fourier(s);           % DFT of input signal
fs = 4;                   % Sampling Frequency 4Hz
df = fs/length(s);        % Frequency interval: f_s / N
f = (0:length(s)-1) * df; % Vector of frequencies (x-Axis)

clf();

subplot(4,1,1);
stem(s);
title("Original signal");

subplot(4,1,2);
stem(f, real(S));
title("DFT (real part)");

subplot(4,1,3);
stem(f, imag(S));
title("DFT (imaginary part)");

subplot(4,1,4);
stem(ifourier(S));
ylim([0 3]);
title("Reconstructed signal");
