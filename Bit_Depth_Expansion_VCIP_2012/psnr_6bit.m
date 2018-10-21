function [ Psnr_DB] = psnr_6bit(I,I_out)
I = double(I);
I_out = double(I_out);
[ScaleX_I ScaleY_I] = size(I);
total_error = 0;
for ii = 1:ScaleX_I
    for jj = 1:ScaleY_I
%         aaa = floor(I(ii,jj)/4);
%         bbb = floor(I_out(ii,jj)/4);
        aaa = I(ii,jj);
        bbb = I_out(ii,jj);
        total_error = total_error + (aaa - bbb)^2;
    end
end
MSE = total_error/(ScaleX_I*ScaleY_I);
Psnr = (63^2)/MSE;
Psnr_DB = 10*log10(Psnr);