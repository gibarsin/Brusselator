function [H, Q]=arnoldi(A, q)
  m = size(A,1);
  % preallocate the memmory so as to save vector columns
  v = zeros(m,m);

  v(:,1) = q/norm(q); % normalize in case it is not

  for j=1:m
    w = A * v(:,j);
    for i=1:j
      a = v(:,i);
      h(i,j) = a' * w;
      w = w - h(i,j) * a;
    end
    aux = norm(w);
    if aux == 0
      break;
    end
    h(j+1,j) = aux;
    v(:,j+1) = w/h(j+1,j);
  end

  Q = v;
  H = h;
end
