% clear all;
% Matlab code and data to reproduce results from the paper :::::::::::
% "BIT-DEPTH EXPANSION USING MINIMUM RISK BASED CLASSIFICATION"


% This software is provided for non-commercial and research purposes only.
% This code is written for the clarity of proposed algorithm without
% considering the time complexity. Hope it will be useful, but without any warranty. For better understanding of the code, please read the paper first.


% Please cite the following paper if you use this code for research purpose:
% Mittal, G.; Jakhetiya, V.; Jaiswal, S.P.; Au, O.C.; Tiwari, A.K.; Dai Wei, "Bit-depth expansion using Minimum Risk Based Classification,
%" Visual Communications and Image Processing (VCIP), 2012 IEEE , vol., no., pp.1,5, 27-30 Nov. 2012, doi: 10.1109/VCIP.2012.6410837
% ---------------------------------------------------------------------------
% Original image of 8 bits is downsampled to 6 bits and reconstructed to 8 bit.
% ---------------------------------------------------------------------------
clear all
% Created by Mr.killer on sep,30,2011

I = imread('images/Lena.pgm');
tic
% I = rgb2gray(I);
I = double(I);
% figure,imshow(uint8(I)),title('Input image');
[X,Y] = size(I);
% Define some variable
I_out = double(zeros(X,Y));
I_out1 = double(zeros(X,Y));
I_out2 = double(zeros(X,Y));
I_out3 = double(zeros(X,Y));
count1 = 0;
count2 = 0;
count3 = 0;
count4 = 0;
kk = 0;
p = double(0);
pm = double(zeros(1,4));
% Zero padding ie. making last two bit zero of every pixel
for i=1:X
    for j=1:Y
        I_out(i,j) = floor(I(i,j)/4)*4;
    end
end
% figure,imshow(uint8(I_out)),title('Output Image from zero padding mathod');
% imwrite(uint8(I_out),'Visual/ZP_Lena.png');
zero_padding_case_psnr_DB = psnr(I,I_out) %#ok<NOPTS>

% Multiplication by an ideal filter
for i=1:X
    for j=1:Y
        I_out1(i,j) = round(floor(I(i,j)/4)*255/63);
    end
end
% figure,imshow(uint8(I_out1)),title('Output Image from multiplication by an ideal gain mathod');
% imwrite(uint8(I_out1),'Visual/MIG_Lena.png');
multiplication_by_an_ideal_gain = psnr(I,I_out1) %#ok<NOPTS>


% Bit replica
for i=1:X
    for j=1:Y
        I_out2(i,j) = floor(I(i,j)/4)*4+floor(I(i,j)/64);
    end
end
% imwrite(uint8(I_out2),'Visual/BR_Lena.png');
Bit_replica_method_psnr_DB = psnr(I,I_out2) %#ok<NOPTS>



% Now our method
I_out3(:,:) = I_out1(:,:);
Error_image = double(zeros(512,512));

for i=2:X-1
    for j=2:Y-1
        p = round((I_out1(i,j-1) + I_out1(i,j+1) + I_out1(i-1,j) + I_out1(i+1,j))/4);
        Error_image(i,j) = I(i,j)-p;
%         Error_image(i,j) = I_out1(i,j)-p;
    end
end
Error_image = reshape(Error_image(2:511,2:511),1,510*510);
XX = -255:255;
kkk = hist(Error_image,XX);

for i=2:X-1
    for j=2:Y-1
        p = round((I_out1(i,j-1) + I_out1(i,j+1) + I_out1(i-1,j) + I_out1(i+1,j))/4);
        
        for k=1:4
            pm(k) = kkk(256+(I_out(i,j)+k-1-p));
        end
        temp = pm(1)+pm(2)+pm(3)+pm(4);
        pm(1) = pm(1)/temp;
        pm(2) = pm(2)/temp;
        pm(3) = pm(3)/temp;
        pm(4) = pm(4)/temp;

        R(1) = 0*pm(1)+1*pm(2)+4*pm(3)+9*pm(4);
        R(2) = 1*pm(1)+0*pm(2)+1*pm(3)+4*pm(4);
        R(3) = 4*pm(1)+1*pm(2)+0*pm(3)+1*pm(4);
        R(4) = 9*pm(1)+4*pm(2)+1*pm(3)+0*pm(4);
        if R(1)==min(R)
            I_out3(i,j) = I_out(i,j);
            count1 = count1+1;
        elseif R(2)==min(R)
            I_out3(i,j) = I_out(i,j)+1;
            count2 = count2+1;
        elseif R(3)==min(R)
            I_out3(i,j) = I_out(i,j)+2;
            count3 = count3+1;
        else
            I_out3(i,j) = I_out(i,j)+3;
            count4 = count4+1;
        end
%         if p <= I_out(i,j)+1
%             I_out3(i,j) = I_out(i,j)+1;
%         elseif p >= I_out(i,j)+2
%             I_out3(i,j) = I_out(i,j) + 2;
%         end
    end
end


%% Assesment of Proposed Algorithm, I_out3 is the final output by proposed Algorithm

Our_method_psnr_DB = psnr(I,I_out3) %#ok<NOPTS>

toc