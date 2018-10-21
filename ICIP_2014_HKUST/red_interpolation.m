%%% THIS CODE IS FROM PAPER ::::::
% “Residual interpolation for color image demosaicking ,” in IEEE Int. Conf. on Image Processing (ICIP), Sept.,2013. ::::::%

function [red tentativeR]= red_interpolation(green, mosaic, mask, h, v, eps)

% R interpolation
tentativeR = guidedfilter(green, mosaic(:,:,1), mask(:,:,1), h, v, eps);
residualR = ( mosaic(:,:,1) - tentativeR ) .* mask(:,:,1);
H = [1/4,1/2,1/4;1/2,1,1/2;1/4,1/2,1/4];


residualR = imfilter(residualR, H, 'replicate');

red = residualR + tentativeR;

end




