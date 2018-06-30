%   This function receives the following arguments:
%   f(x) = a function of x
%   a, b = components of the [a,b] interval.
%   n = number of subintervals of [a,b].
%     IMPORTANT: n must be a positive and even integer. (e.g.: 2, 4, 6, 8, ...)
%
%   Utilizing the Composite Simpson's 1/3 rule, with those parameters, 
% this function returns the following variable:
%   I = the approximation of the integral of f(x), from a to b, with n subintervals
function I = simpc13(f, a, b, n)
  if (nargin == 3)
    n = 1000;
  elseif (nargin != 4)
    I = "ERR_INVALID_INPUT"; return; endif;
  if (n <=0 || rem(n,2) != 0) % Checking parameters
    I = "ERR_INVALID_INPUT"; return; endif;
  h = (b-a)/n; % h = size of each subinterval
  s = f(a) + f(b); % Sum of first and last terms
  for i = 1:2:n % Sum of even terms
    s += 4 * f(a+i*h); endfor;
  for i = 2:2:n-1 % Sum of odd terms
    s += 2 * f(a+i*h); endfor;
  I = s * h / 3; % I = approximation of the result
  return;
endfunction;