function image = reconstruct(L)
  n = size(L, 2)
  
  G{n} = L{n}
  for i = n-1:-1:1
    G{i} = imresize(G{i+1}, 2) + L{i};
  endfor
  image = G{1};
endfunction
