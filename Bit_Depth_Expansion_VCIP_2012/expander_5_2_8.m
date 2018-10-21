% Matlab code and data to reproduce results from the paper :::::::::::
% "BIT-DEPTH EXPANSION USING MINIMUM RISK BASED CLASSIFICATION"


% This software is provided for non-commercial and research purposes only.
% This code is written for the clarity of proposed algorithm without
% considering the time complexity. Hope it will be useful, but without any warranty. For better understanding of the code, please read the paper first.


% Please cite the following paper if you use this code for research purpose:
% Mittal, G.; Jakhetiya, V.; Jaiswal, S.P.; Au, O.C.; Tiwari, A.K.; Dai Wei, "Bit-depth expansion using Minimum Risk Based Classification,
%" Visual Communications and Image Processing (VCIP), 2012 IEEE , vol., no., pp.1,5, 27-30 Nov. 2012, doi: 10.1109/VCIP.2012.6410837
% ---------------------------------------------------------------------------
% Original image of 8 bits is downsampled to 5 bits and reconstructed to 8 bit.
% ---------------------------------------------------------------------------
clear all;
close all;


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
count0 = 0;
count1 = 0;
count2 = 0;
count3 = 0;
count4 = 0;
count5 = 0;
count6 = 0;
count7 = 0;
count8 = 0;

count11 = 0;
count22 = 0;
count33 = 0;
count44 = 0;
pm = double(zeros(1,8));
p = double(0);
%% Zero padding ie. making last three bit zero of every pixel
for i=1:X
    for j=1:Y
        I_out(i,j) = floor(I(i,j)/8)*8;
    end
end
% figure,imshow(uint8(I_out)),title('Output Image from zero padding mathod');
Existing_Zero_padding_case_psnr_DB = psnr(I,I_out)  %#ok<NOPTS>


%% Multiplication by an ideal filter
for i=1:X
    for j=1:Y
        I_out1(i,j) = round(floor(I(i,j)/8)*255/31);
    end
end
% figure,imshow(uint8(I_out1)),title('Output Image from multiplication by an ideal gain mathod');
Existing_multiplication_by_an_ideal_gain_psnr_DB = psnr(I,I_out1) %#ok<NOPTS>

%% Bit replica
for i=1:X
    for j=1:Y
        I_out2(i,j) = floor(I(i,j)/8)*8+floor(I(i,j)/32);
    end
end
Existing_Bit_replica_method_psnr_DB = psnr(I,I_out2) %#ok<NOPTS>


%% Now our method
I_out3(:,:) = I_out1(:,:);
Error_image = double(zeros(512,512));

for i=2:X-1
    for j=2:Y-1
        p = round((I_out1(i,j-1) + I_out1(i,j+1) + I_out1(i-1,j) + I_out1(i+1,j))/4);
        Error_image(i,j) = I(i,j)-p;
    end
end
Error_image = reshape(Error_image(2:511,2:511),1,510*510);
XX = -255:255;
kkk = hist(Error_image,XX);


% figure,imshow(uint8(I_out3)),title('Output Image using prediction methods');
for i=2:X-1
    for j=2:Y-1
        p = round((I_out1(i,j-1) + I_out1(i,j+1) + I_out1(i-1,j) + I_out1(i+1,j))/4);
        
        for k=1:8
            pm(k) = kkk(256+(I_out(i,j)+k-1-p));
        end
        temp = pm(1)+pm(2)+pm(3)+pm(4)+pm(5)+pm(6)+pm(7)+pm(8);
        pm(1) = pm(1)/temp;
        pm(2) = pm(2)/temp;
        pm(3) = pm(3)/temp;
        pm(4) = pm(4)/temp;
        pm(5) = pm(5)/temp;
        pm(6) = pm(6)/temp;
        pm(7) = pm(7)/temp;
        pm(8) = pm(8)/temp;
        
        R(1) = 0*pm(1)+1*pm(2)+4*pm(3)+9*pm(4)+16*pm(5)+25*pm(6)+36*pm(7)+49*pm(8);
        R(2) = 1*pm(1)+0*pm(2)+1*pm(3)+4*pm(4)+9*pm(5)+16*pm(6)+25*pm(7)+36*pm(8);
        R(3) = 4*pm(1)+1*pm(2)+0*pm(3)+1*pm(4)+4*pm(5)+9*pm(6)+16*pm(7)+25*pm(8);
        R(4) = 9*pm(1)+4*pm(2)+1*pm(3)+0*pm(4)+1*pm(5)+4*pm(6)+9*pm(7)+16*pm(8);
        R(5) = 16*pm(1)+9*pm(2)+4*pm(3)+1*pm(4)+0*pm(5)+1*pm(6)+4*pm(7)+9*pm(8);
        R(6) = 25*pm(1)+16*pm(2)+9*pm(3)+4*pm(4)+1*pm(5)+0*pm(6)+1*pm(7)+4*pm(8);
        R(7) = 36*pm(1)+25*pm(2)+16*pm(3)+9*pm(4)+4*pm(5)+1*pm(6)+0*pm(7)+1*pm(8);
        R(8) = 49*pm(1)+36*pm(2)+25*pm(3)+16*pm(4)+9*pm(5)+4*pm(6)+1*pm(7)+0*pm(8);
        
        if R(1)==min(R)
            I_out3(i,j) = I_out(i,j);
            count1 = count1+1;
        elseif R(2)==min(R)
            I_out3(i,j) = I_out(i,j)+1;
            count2 = count2+1;
        elseif R(3)==min(R)
            I_out3(i,j) = I_out(i,j)+2;
            count3 = count3+1;
        elseif R(4)==min(R)
            I_out3(i,j) = I_out(i,j)+3;
            count4 = count4+1;
        elseif R(5)==min(R)
            I_out3(i,j) = I_out(i,j)+4;
            count5 = count5+1;
        elseif R(6)==min(R)
            I_out3(i,j) = I_out(i,j)+5;
            count6 = count6+1;
        elseif R(7)==min(R)
            I_out3(i,j) = I_out(i,j)+6;
            count7 = count7+1;
        else
            I_out3(i,j) = I_out(i,j)+7;
            count8 = count8+1;
        end
%         count11 = count11+pm(1);
%         count22 = count22+pm(2);
%         count33 = count33+pm(3);
%         count44 = count44+pm(4);
          

    end
end

%% Assesment of Proposed Algorithm, I_out3 is the final output by proposed Algorithm

Existing_Our_method_psnr_DB = psnr(I,I_out3) %#ok<NOPTS>
% figure,imshow(uint8(I_out3)),title('Output Image using prediction methods');
toc