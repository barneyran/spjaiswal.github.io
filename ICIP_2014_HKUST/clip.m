%THIS CODE IS FROM PAPER ::::::
% “Residual interpolation for color image demosaicking ,” in IEEE Int. Conf. on Image Processing (ICIP), Sept.,2013. ::::::

function [Y] = clip(X, lo, hi)

Y = X;
Y(X<lo) = lo;
Y(X>hi) = hi;

end
