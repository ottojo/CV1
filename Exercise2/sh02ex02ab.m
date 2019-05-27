% Task 2: DFT a), b)
% Implementation of DFT: fourier.m
s = [2 3 0 1];            % Input signal
S = fourier(s);           % DFT of input signal

% Plot sine component at 1Hz:
f = 1;
t = 0:.002:1
y = imag(S(f + 1)) * sin(t * 2 * pi * f);
clf();
plot(t,y);
