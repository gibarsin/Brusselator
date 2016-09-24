 # http://www.math.usm.edu/lambers/mat610/sum10/lecture9.pdf
 # page 3 & 4
 
 function [Q,R] = qrgivens(A)
 
   [rows, cols] = size(A)
   
   Q = eye(rows)
   
   R = A
   
   for j=1:cols do
   
    for i=rows:-1:j+1 do
    
      [c, s] = givensrotationmatrix(A(i-1, j), A(i, j))
      
      G = eye(rows)
      G( [i-1, i], [i-1, i]) = [ c -s; s c]
      R = transpose(G) * R
      Q = Q * G
      
    end
   
   end
 
 end