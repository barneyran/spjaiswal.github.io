function [out_pro, PSNR_final]= red_lmmse(input_im,rgb_tentative)



[m, n, z]=size(input_im);

R_org=input_im(:,:,1);
G_org=input_im(:,:,2);
G_residual = rgb_tentative(:,:,2);  %%  FOR BETTER RESULT USE BETTER EXISITING ALGORITHM



%% IMPLEMENTING TRADITIONAL COLOR DIFFERENCE INTERPOLATION METHOD
HPF = zeros(m,n);
r_cdi = R_org;
r_simple = R_org;


for i=2:m-1
    for j=2:n-1
        
        if mod(i,2) == 0 && mod(j,2) == 1     % EVEN ODD
            
            r_simple(i,j) = (R_org(i-1,j-1) + R_org(i+1,j+1) + R_org(i-1,j+1) + R_org(i+1,j-1))/4 ;
            HPF(i,j) = - .25*(G_residual(i-1,j-1) + G_residual(i+1,j+1) + G_residual(i-1,j+1) + G_residual(i+1,j-1)) + 1*G_residual(i,j);
            r_cdi(i,j) = r_simple(i,j)  + HPF(i,j);
            
            
        end
        
        
        if mod(i,2) == 1 && mod(j,2) == 1  % ODD ODD
            
            r_simple(i,j) = (R_org(i,j-1) + R_org(i,j+1))/2;
            HPF(i,j) = - .5*( G_residual(i,j-1)+ G_residual(i,j+1)) + 1*G_org(i,j) ;
            r_cdi(i,j) = r_simple(i,j) + HPF(i,j) ;
            
            
        end
        
        
        
        if mod(i,2) == 0 && mod(j,2) == 0  % EVEN EVEN
            
            r_simple(i,j) = (R_org(i-1,j) + R_org(i+1,j) )/2;
            HPF(i,j) = - .5*(G_residual(i-1,j) + G_residual(i+1,j)) + 1*G_org(i,j);
            r_cdi(i,j) = r_simple(i,j)  + HPF(i,j) ;
            
            
        end
        
    end
end



%% PROPOSED LMMSE BASED DEMOSAICING ALGORITHM

blk_size=6;
blk_size1=6;
final_output = r_cdi;
m1=floor(m/blk_size)*blk_size;
n1=floor(n/blk_size1)*blk_size1;
countt=0;
better_red = rgb_tentative(:,:,1);  %%  FOR BETTER RESULT USE BETTER EXISITING ALGORITHM


for i=1:blk_size:m1
    for j=1:blk_size1:n1
        countt = countt+1;
        
        v1 = better_red(i:i+blk_size-1,j:j+blk_size1-1) - r_simple(i:i+blk_size-1,j:j+blk_size1-1);
        v2 = better_red(i:i+blk_size-1,j:j+blk_size1-1) - r_cdi(i:i+blk_size-1,j:j+blk_size1-1);
        
        AA = (mean(mean(v2.*(v2-v1)))/(mean(mean((v2-v1).^2))));
        if  AA < 0
            AA = 0;
        end
        
        if AA > 1
            AA = 1;
        end
        
        
        w1(countt) = AA;
        w2(countt) = 1 - w1(countt);
        
        
        
        final_output(i:i+blk_size-1,j:j+blk_size1-1) = w1(countt)*r_simple(i:i+blk_size-1,j:j+blk_size1-1)+ w2(countt)*(r_cdi(i:i+blk_size-1,j:j+blk_size1-1));
        
        
        
    end
end





%% Results
final_output = round(final_output);
PSNR_final = PSNR(R_org,final_output);
out_pro = final_output;


end
