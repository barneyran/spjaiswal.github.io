%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%       计算两帧之间的PSNR       
%%       author: 干宗良 ( ganzongliang@hotmail )  
%%       Data:   2006年
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function SNR = PSNR(FrameOne,FrameTwo)

FrameOne = double(FrameOne);
FrameTwo = double(FrameTwo);
[w,h]=size(FrameTwo);
% 4 4 507 507
FrameOne = imcrop(FrameOne,[2 2 h-3 w-3]);
FrameTwo = imcrop(FrameTwo,[2 2 h-3 w-3]);


[w1,h1]=size(FrameOne);
[w2,h2]=size(FrameOne);



MSE = sum((FrameOne(:)-FrameTwo(:)).^2);
% mse = MSE
TotalPixel = w1*h1;
% [w h];
SNR = 10 * log10((255 * 255) / (MSE /TotalPixel));
