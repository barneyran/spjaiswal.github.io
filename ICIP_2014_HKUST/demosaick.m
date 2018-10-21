%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  THIS CODE IS FROM PAPER ::::::
% “Residual interpolation for color image demosaicking ,” in IEEE Int. Conf. on Image Processing (ICIP), Sept.,2013. ::::::
% 
%   Main funtion
%     rgb_dem = demosaick(rgb, pattern, sigma)
%
%      Input
%       - rgb		: full RGB image or mosaic data
%       - pattern	: mosaic pattern 
%                       default : 'grbg'
%                       others  : 'rggb','gbrg','bggr'	
%       - sigma		: standard deviation of gaussian filter(default : 1)
%                       * For Kodak image data set, 1e8 works well.
%
%      Output 
%       - rgb_dem   : result image
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function  [rgb_tentative]= demosaick(rgb, pattern, sigma)

% mosaic and mask
[mosaic mask] = mosaic_bayer(rgb, pattern);
%  size(mosaic)
%  size(mask)
%   imwrite(uint8(mosaic), 'Mosaic.tif');
%  figure,imshow(uint8(mosaic)),title('mfasdosaic');
%  figure,imshow(uint8(mask*255)),title('mask');
 
% green interpolation
% for i=1:512
%     for j=1:512
%         if mosaic(i,j,1) == 0
%             count = count + 1;
%         end
%     end
% end

green = green_interpolation(mosaic, mask, pattern, sigma); 
% psnr_green = PSNR(green,rgb(:,:,2))
% parameters for guided upsampling
h = 5;
v = 5;
eps = 0;
% Red and Blue demosaicking
[red tentative_red]= red_interpolation(green, mosaic, mask, h, v, eps);
[blue tentative_blue] = blue_interpolation(green, mosaic, mask, h, v, eps);

% result image
rgb_tentative(:,:,1) = red;
rgb_tentative(:,:,2) = green;
rgb_tentative(:,:,3) = blue;

end
