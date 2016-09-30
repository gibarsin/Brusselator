function ans = trace_own(A)
  % A should be square
  l = length(A);
  tr = 0;
  for i=1:l
    tr += A(i,i);
  end
  ans = tr;
end
