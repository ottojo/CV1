function S = fourier(s)

N = length(s);

S = zeros(1, N);

for u = 1:N
    for t = 1:N
        S(u) = S(u) + s(t) * exp(-1i * 2 * pi * (u/N) * t);
    end
    S(u) = S(u) * (1/sqrt(N));
end

%TODO: compared with wolfram alpha:
% Wrong sign (not always?)
% Wrong order