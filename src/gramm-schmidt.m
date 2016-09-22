function Q = grammschmidt(A)
  q = A(:,1);
  q = q/norm(q);

  n = length(A);
  Q = zeros(n);
  Q(:,1) = q;
  for k=2:n
    pk = A(:,k);
    xk = pk;
    for m=1:k-1
      qm = Q(:,m);
      mod = qm' * xk;
      pk = pk - mod * qm;
    end
    Q(:,k) = pk/norm(pk);
  end
end
