function ans = det2(A)
  % A should have length = 2
  a = A(1,1);
  b = A(1,2);
  c = A(2,1);
  d = A(2,2);
  ans = a*d - c*b;
end
