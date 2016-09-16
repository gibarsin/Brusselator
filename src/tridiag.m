function mat = tridiag(N, x, y, z)
	mat = eye(N) .* y;
	for i = 1:(N-1)
		mat(i+1, i) = z;
		mat(i, i+1) = x;
	end
endfunction