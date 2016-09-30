function [Q,R] = qrhessenberg(A)

  [rows, cols] = size(A);
  
  Q_t = eye(cols);
  
  R = A;
  
  for i=1:cols-1
    [G, R] = givensrotation(R, i, i, i+1);
    
    Q_t(i:i+1,:) = G*Q_t(i:i+1,:);
    
  end
   
   Q = Q_t';

endfunction

function [G, R] = givensrotation(A, i, j1, j2)

  [rows, cols] = size(A);
  
  G = zeros(2);
  A1 = zeros(2,cols);
  A1(1,:) = A(j1,:);
  A1(2,:) = A(j2,:);
  R = A;
  
  theta = atan(A(j2,i)/A(j1,i));
  G(1,1) = cos(theta);
  G(1,2) = sin(theta);
  G(2,1) = -sin(theta);
  G(2,2) = cos(theta);
  
  A1 = G*A1;
  
  R(j1,:) = A1(1,:);
  R(j2,:) = A1(2,:);
  
endfunction