function [H, Q]=arnoldi(A, q)
  m = size(A,1);
  % preallocate the memmory so as to save vector columns
  q(:,1) = q/norm(q) % normalize in case it is not
  for k = 2:m
    q(:,k) = A * q(:,k-1)
    for j = 1:k-1
      h(j, k-1) = q(:,j)' * q(:,k)
      q(:,k) = q(:,k) - h(j, k-1)
    end
    h(k, k-1) = norm(q(:,k))
    q(:,k) = q(:,k)/h(k, k-1)
  end

  H = h;
  Q = q;
endfunction
