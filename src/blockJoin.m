
function mat = blockJoin(b1, b2, b3, b4)
	mat = cat(1,
		cat(2, b1, b2)',
		cat(2, b3, b4)');
	mat = mat';
endfunction
