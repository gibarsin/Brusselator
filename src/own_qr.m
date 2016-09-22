source 'gramm-schmidt.m'

function [Q, R] = own_qr(A)
  q = zeros(length(A), 1);
  q(1) = 1;
  [H, Q] = arnoldi(A, q);
  R = Q' * A;
  Q = Q;
end
