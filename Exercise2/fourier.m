function S = fourier(s)

N = length(s);

S = zeros(1, N);

for u = 0:N-1
    for t = 0:N-1
        S(u+1) = S(u+1) + s(t+1) * exp(-1i * 2 * pi * (u/N) * t);
    end
    S(u+1) = S(u+1) * (1/sqrt(N));
end