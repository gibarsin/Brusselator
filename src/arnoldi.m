function [H, Q]=arnoldi(A, q)
  m = size(A,1);
  % preallocate the memmory so as to save vector columns
  v = zeros(m,m);
  w = zeros(m,m);

  v(:,1) = q/norm(q); % normalize in case it is not

  for j=1:m
    t = A * v(:,j);
    w(:,j) = t;
    for i=1:j
      a = v(:,i);
      h(i,j) = a' * t;
      w(:,j) = w(:,j) - h(i,j) * a;
    end
    aux = norm(w(:,j));
    if aux == 0
      break;
    end
    h(j+1,j) = aux;
    v(:,j+1) = w(:,j)/h(j+1,j);
  end

  Q = v;
  H = h;
end
