function [Psnr_DB] = psnr(I,I_out)
I = double(I);
I_out = double(I_out);
[ScaleX_I ScaleY_I] = size(I);
total_error = 0;
for ii = 1:ScaleX_I
    for jj = 1:ScaleY_I
        total_error = total_error + (I(ii,jj)-I_out(ii,jj))^2;
    end
end
MSE = total_error/(ScaleX_I*ScaleY_I);
Psnr = (255^2)/MSE;
Psnr_DB = 10*log10(Psnr);