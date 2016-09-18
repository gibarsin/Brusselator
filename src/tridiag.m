function mat = tridiag(N, x, y, z)
  % match the definition of gallery('tridiag',n,c,d,e)
  % see: http://www.mathworks.com/help/matlab/ref/gallery.html#f84-1000284
	mat = eye(N) * y;
	for i = 1:(N-1)
    mat(i+1, i) = x; % element below the diagonal
    mat(i, i+1) = z; % element above the diagonal
	end
endfunction
