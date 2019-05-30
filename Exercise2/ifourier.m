function s = ifourier(S)
    N = length(S);
    s = zeros(1, N);
    
    for t=1:1:N
        for u=1:1:N
            s(t) = s(t) + S(u) * exp(1i*2*pi*(u-1)*(t-1)/N);
        end
        s(t) = (1/sqrt(N)) * s(t);
    end
end