 # http://www.math.usm.edu/lambers/mat610/sum10/lecture9.pdf
 # page 3 & 4
 
 function [Q,R] = qrgivens(A)
 
   [rows, cols] = size(A);
   
   Q = eye(rows);
   
   R = A;
   
   for j=1:cols
   
    for i=rows:-1:j+1
    
      [c, s] = givensrotationmatrix(R(i-1, j), R(i, j));
      
      G = eye(rows);
      G( [i-1, i], [i-1, i]) = [ c -s; s c];
      R = transpose(G) * R;
      Q = Q * G;
      
    end
   
   end
 
 end