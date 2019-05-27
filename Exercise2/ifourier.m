function s = ifourier(S)

N = length(S);

s = zeros(1, N);

for u = 0:N-1
    for t = 0:N-1
        s(u+1) = s(u+1) + S(t+1) * exp(i * 2 * pi * (u/N) * t);
    end
    s(u+1) = s(u+1) * (1/sqrt(N));
end