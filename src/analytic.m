function ans=analyticbrusellator(m, L, d1, d2, alpha, beta)
  % Computes the eigenvalues of the matrix A, such as
  % A = | tau1T + (beta - 1)I      alpha^2I       |
  %     |       -betaI          tau2T - alpha^2I  |
  %
  % where T = tridiag(m, 1, -2, 1),
  % tau1 = d1/((h*L)**2) and tau2 = d2/((h*L)**2).
  %
  % Usage
  %     ans=analyticbrusellator(m, L, d1, d2, alpha, beta)

  h = 1/(m+1);
  tau1 = d1/((h*L)**2);
  tau2 = d2/((h*L)**2);

  % compute the eigenvalues of T
  for j = 1:m
    eigOfT(j) = -2 * (1 - cos(pi * j * h)) ; % eigenvalues of T
  end

  % compute the eigenvalues of A
  for j = 1:m
    coeff(1) = 1;
    coeff(2) = alpha**2 - beta + 1 - (tau1+tau2) * eigOfT(j);
    coeff(3) =  beta * alpha**2 + tau1 * tau2 * eigOfT(j)**2 + ...
                tau2 * (beta - 1) * eigOfT(j) - ...
                alpha**2 * tau1 * eigOfT(j) - alpha**2 * (beta - 1);
    d = roots(coeff);
    % eigenvalues of A
    eigOfA(j) = d(1);
    eigOfA(m+j) = d(2);
  end
  ans = eigOfA;
endfunction
