
function mat = blockJoin(b1, b2, b3, b4)
	# Buscar una forma mas linda de resolver esto.
	mat = cat(2,
		cat(2, b1, b2)',
		cat(2, b3, b4)');
	mat = mat';
endfunction