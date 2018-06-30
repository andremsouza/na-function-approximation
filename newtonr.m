% 	This function receives the following arguments:
% 	f(x) = a function of x
%	df(x) = the derivative of f(x)
%	xo = initial value of x
%	eps = precision
%	itmax = maximum number of iterations
%
%	Utilizing the Newton's method for calculating the root of a function,
% this function returns the following variables:
%	x = the vector of approximations of the root of f(x)
%	err = the errors for each approximation of x
function [x, err] = newtonr(f, df, xo, eps, itmax)
	if(nargin == 3)
		eps = 1e-10;
		itmax = inf;
	elseif (nargin == 4)
		itmax = inf;
	elseif (nargin != 5)
		x = err ="ERR_INVALID_INPUT"; return;
	endif;
	x(1) = xo - f(xo)/df(xo);
	err(1) = abs(x(1)-xo);
	k=2;
	while(err(k-1) >= eps && k<=itmax)
		x(k) = x(k-1) - f(x(k-1))/df(x(k-1));
		err(k) = abs(x(k)-x(k-1));
		k = k+1;
	endwhile;
	return;
endfunction;