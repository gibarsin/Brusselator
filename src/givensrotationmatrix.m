# http://www.math.usm.edu/lambers/mat610/sum10/lecture9.pdf
# page 3

function [c, s]=givensrotationmatrix(a,b)

  if b == 0
  
    c = 1;
    s = 0;
  
  else

    if abs(b) >= abs(a)
    
      tau = a / b;
      
      s = 1 / sqrt(1 + tau**2);
      c = s * tau;
    
    else
    
      tau = b / a;
      
      c = 1 / sqrt(1 + tau**2);
      s =  c * tau;
    
    end

  end

end