#	Function that gets the A matrix.
#
#	m - block size
#	L - L
#	d1 - d1
# 	d2 - d2
# 	a - a
#	b - b
#
function matrix = getMatrix(m, L, d1, d2, a, b)
	h = 1/(m+1);
	t1 = d1/((h*L)**2);
	t2 = d2/((h*L)**2);
	T = tridiag(m, 1, -2, 1);
	b1 = t1*T+(b+1)*eye(m);
	b2 = (a**2)*eye(m);
	b3 = -b*eye(m);
	b4 = t2*T-(a**2)*eye(m);
	matrix = blockJoin(b1, b2, b3, b4);
endfunction
