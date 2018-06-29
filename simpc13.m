% This function takes a f(x) function and calculates the approximate
% definite integral of f(x) in the interval [a,b], utilizing the composite
% Simpson's 1/3 rule, with [a,b] split into n subintervals.
% Note: the n parameter must be an even integer
function I = simpc13(f, a, b, n)
  if (n <=0 || rem(n,2) != 0) # Checking parameters
    I = "ERR_INVALID_INPUT"; return; endif;
  h = (b-a)/n; # h = size of each subinterval
  s = f(a) + f(b); # Sum of first and last terms
  for i = 1:2:n # Sum of even terms
    s += 4 * f(a+i*h); endfor;
  for i = 2:2:n-1 # Sum of odd terms
    s += 2 * f(a+i*h); endfor;
  I = s * h / 3; # I = approximation of the result
  return;
endfunction;