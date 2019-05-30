function S = fourier(s)
    N = length(s);
    S = zeros(1, N);
    
    for u=1:1:N
        for t=1:1:N
            S(u) = S(u) + s(t) * exp(-1i*2*pi*(u-1)*(t-1)/N);
        end
        S(u) = (1/sqrt(N)) * S(u);
    end
end