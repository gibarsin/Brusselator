function [eigen,count] = eigenqrshift(A)
  n = length(A);
  % get B, the hessenberg matrix returned by the arnoldi method
  [B,V] = arnoldi(A, A(:,1));
  % n1 - dimension of B
  n1 = n;
  count = 0;
  eigen = zeros(n,1);
  % keep cycling until all eigenvalues have been found,
  % i.e., B's subdiagonal elements are all rounding 0.
  while true
    % A1 = bottom right 2x2 matrix of B
    A1 = B(n1-1:n1, n1-1:n1);

    % Shif the B matrix
    % Have to determine shifting's value and the method to be used

    % For that, check if discriminant is < 0 to decide
    % what variant of the QR shifting method to use at this current step:
    % - Francis (discr < 0) => for complex eigenvalues
    % - Wilkinson (discr >= 0) => for real eigenvalues
    Tr = trace(A1);
    D = det(A1);
    count = count + 1;
    discr = Tr ^ 2 - 4 * D;
    if  discr < 0 % use Francis QR method step
      M = B * B - Tr * B + D * eye(n1);
      % [Z,R] = qrgivens(M); % +++xown
      [Z,R] = qr(M); % +++xown
      B = Z' * B * Z;
    else % use Wilkinson QR method step
      e = eig2(A1);
      a2 = A1(2,2);
      d1 = abs(e(1)-a2);
      d2 = abs(e(2)-a2);
      d = min (d1, d2);
      I = eye(n1);
      B = B - d*I;
      % [Q,R] = qrhessenberg(B); % +++xown
      [Q,R] = qr(B); % +++xown
      B = R*Q + d*I;
    end

    % Once the shift have been applied,
    % check which case of convergence we have, if any
    if (abs(B(n1-1,n1-2)) < 1e-6)
      % This means that the original matrix can be splitted into two:
      % - C = bottom right 2x2 matrix of B (remember that this B has the shifts applied)
      % - B1 = left top (1:n-2, 1:n-2) matrix of B
      % eigenvalues of both B1 and C will be the eigenvalues of B.
      % For now, we can only compute C eigenvalues, as it is a 2x2 matrix.
      % But will go on processing B1 matrix as B.
      % This process is based on defaltion mechanism.
      C = B(n1-1:n1, n1-1:n1);
      e = eig2(C);
      eigen(n-n1+1) = e(1);
      eigen(n-n1+2) = e(2);
      B1 = B(1:n1-2, 1:n1-2);
      B = B1;
      n1 = n1-2;
    elseif (abs(B(n1,n1-1)) < 1e-6)
      % This means that the last element of the B's diagonal has no value at the left,
      % i.e., it has converged to an eigenvalue of B
      % We take that eigenvalue, and deflate the B's matrix by removing the row and column
      % corresponding to the just taken eigenvalue
      eigen(n-n1+1) = B(n1,n1);
      B1 = B(1:n1-1, 1:n1-1);
      B = B1;
      n1 = n1-1;
    end

    % Check what's left to do
    % Any of these cases should be resolved right now
    % to avoid index out of bounds on the next iteration
    if n1 == 1  % only one element remains, and it is on the main diagonal
                % => it is an eigenvalue => get it and finish
      eigen(n) = B(1,1);
      break;
    elseif n1 == 2 % 2x2 matrix remains => get its eigenvalues and finish
      e = eig2(B);
      eigen(n-1) = e(1);
      eigen(n) = e(2);
      break;
    end

    % If we reach here, B matrix should keep being processed.
  end
end
