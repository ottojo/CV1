function stemcomplex( k, x )
%STEMCOMPLEX   Discrete sequence or "stem" plot (complex-valued sequence).
%
%   stemcomplex( x ) or stemcomplex( k, x )
%   x (and k) have to be vectors

% (C) RoF / NT
k = k(:).';
if nargin==1,
  x = k;
  k = 1:length(x);
else,
  x = x(:).';
end;

kk = [k; k; NaN*ones(size(k))];
xx = [zeros(size(k)); x; NaN*ones(size(k))];
%
plot3( [min(k) max(k)], [0 0], [0 0], 'k-', ...
        k,  real(x),  imag(x),  'bo', ...
        kk, real(xx), imag(xx), 'b-' );
grid on;
axis ij;
axis square;
view([-45 30]);
xlabel('u -->')
ylabel('Re -->')
zlabel('Im -->')
