% This algorithm was adapted from
% Y. Saad, 'Numerical Methods for Large Eigenvalue Problems', Second Edition
%   Society for Industrial and Applied Mathematics, 2011
% Algorithm 6.2 Arnoldi - Modified Gram-Schmidt

function [H, V]=arnoldi(A, q)
  m = size(A,1);
  % preallocate the memmory so as to save vector columns
  v = zeros(m,m);

  v(:,1) = q/norm(q); % normalize in case it is not

  % apply a modified gram-schmidt algorithm
  for j=1:m
    w = A * v(:,j);
    % get the previous calculated column and multiply the matrix A by it
    % for each of the previous vectors, apply a gram-schmidt orthnormalization
    % i.e., make the current w vector orthgonal to all previous vectors, and then normalize
    for i=1:j
      a = v(:,i);
      % this value will be retrieved in matrix H, that will be a Hessenberg descomposition
      % of matrix A
      h(i,j) = a' * w; % dot product between current vector and the already normalized versor a
      w = w - h(i,j) * a;
    end
    aux = norm(w);
    if j == m
      % j == m should be reached to calculate h(i,j) above
      % however, this condition cannot be passed through as it would cause H and Q not to be square
      break;
    end
    % this value is below the main diagonal of the matrix H
    h(j+1,j) = aux;
    % save the current orthonormalized vector as the following on the vector's matrix v
    v(:,j+1) = w/h(j+1,j);
  end

  V = v;
  H = h;
end
