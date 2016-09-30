function ans = roots2(p)
  % Compute the roots of the polynomial p.

  % For a vector p with 3 components, return the roots of the polynomial
  %        p(1) * x^2 + c(2) * x + p(3)

  %   As an example, the following code finds the roots of the quadratic
  %   polynomial
  %        p(x) = x^2 - 5.
  %        c = [1, 0, -5];
  %        roots (c)
  %        =>  2.2361
  %        => -2.2361
  a = p(1);
  b = p(2);
  c = p(3);

  part1 = -b/(2*a);
  part2 = sqrt(b**2-4*a*c)/(2*a);

  r1 = part1 + part2;
  r2 = part1 - part2;

  ans = [r1;r2];
end
