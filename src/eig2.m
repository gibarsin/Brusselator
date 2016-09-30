function evalues = eig2(A)
  % A should have length = 2
  p = [1, -trace_own(A), det2(A)];
  evalues = roots2(p);
end
