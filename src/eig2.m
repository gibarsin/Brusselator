function evalues = eig2(A)
  % A should have length = 2
  p = [1, -trace(A), det(A)];
  evalues = roots(p);
end
