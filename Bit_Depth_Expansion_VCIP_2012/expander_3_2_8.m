% Matlab code and data to reproduce results from the paper :::::::::::
% "BIT-DEPTH EXPANSION USING MINIMUM RISK BASED CLASSIFICATION"


% This software is provided for non-commercial and research purposes only.
% This code is written for the clarity of proposed algorithm without
% considering the time complexity. Hope it will be useful, but without any warranty. For better understanding of the code, please read the paper first.


% Please cite the following paper if you use this code for research purpose:
% Mittal, G.; Jakhetiya, V.; Jaiswal, S.P.; Au, O.C.; Tiwari, A.K.; Dai Wei, "Bit-depth expansion using Minimum Risk Based Classification,
%" Visual Communications and Image Processing (VCIP), 2012 IEEE , vol., no., pp.1,5, 27-30 Nov. 2012, doi: 10.1109/VCIP.2012.6410837

% ---------------------------------------------------------------------------
% Original image of 8 bits is downsampled to 3 bits and reconstructed to 8 bit.
% ---------------------------------------------------------------------------


close all;
clear all

% Created by Mr.killer on sep,30,2011

I = imread('images/Lena.pgm');
tic
if size(I,3) > 1
    I = rgb2gray(I);
end
I = double(I);
% figure,imshow(uint8(I)),title('Input image');
[X,Y] = size(I);

%% Define some variable
I_out = double(zeros(X,Y));
I_out1 = double(zeros(X,Y));
I_out2 = double(zeros(X,Y));
I_out3 = double(zeros(X,Y));
pm = double(zeros(1,32));
p = double(0);

%% Zero padding ie. making last two bit zero of every pixel
for i=1:X
    for j=1:Y
        I_out(i,j) = floor(I(i,j)/32)*32;
    end
end
Existing_Zero_padding_case_psnr_DB = psnr(I,I_out)

%% Multiplication by an ideal filter
for i=1:X
    for j=1:Y
        I_out1(i,j) = round(floor(I(i,j)/32)*255/7);
    end
end
Existing_Multiplication_by_an_ideal_gain_psnr_DB = psnr(I,I_out1)

%% Proposed method
I_out3(:,:) = I_out1(:,:);
Error_image = double(zeros(512,512));
WTF = 0;
for i=2:X-1
    for j=2:Y-1
        p = round((I_out1(i,j-1) + I_out1(i,j+1) + I_out1(i-1,j) + I_out1(i+1,j))/4);
        Error_image(i,j) = I_out1(i,j) - p;
    end
end
Error_image = reshape(Error_image(2:511,2:511),1,510*510);
XX = -255:255;
kkk = hist(Error_image,XX);
for i=2:X-1
    for j=2:Y-1
        p = round((I_out1(i,j-1) + I_out1(i,j+1) + I_out1(i-1,j) + I_out1(i+1,j))/4);
        for k=1:32
            pm(k) = kkk(256+(I_out(i,j)+k-1-p));
        end
        temp = sum(pm);
        for k=1:32
            pm(k) = pm(k)/temp;
        end
        R = double(zeros(1,32));
        for ii = 1:32
            temp1 = 0;
            for jj = 1:32
                temp1 = temp1 + ((ii-jj)^2)*pm(jj);
            end
            R(ii) = temp1;
        end
        
        for ii=1:32
            if R(ii) == min(R)
                I_out3(i,j) = I_out(i,j) + ii -1;
            end
        end
    end
end

%% Assesment of proposed Algorithm, I_out3 is the final output by proposed Algorithm

Our_method_psnr_DB = psnr(I,I_out3)

toc