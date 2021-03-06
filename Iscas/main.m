% Matlab code and data to reproduce results from the paper :::::::::::
% "An Efficient Image Interpolation Algorithm Based upon the Switching and Self Learned Characteristics of Natural Images"


% This software is provided for non-commercial and research purposes only.
% This code is written for the clarity of proposed algorithm without
% considering the time complexity. Due to lack of time, This algorithm is designed for 512X512 image only.
% Hope it will be useful, but without any warranty. For better understanding of the code, please read the paper first.

% For initialization, in our method we generate a tentative output from an existing method. There are lot of existing methods that can be used to generate a tentative output.
% In the simulation result in the paper, we used the source code of SAI method: �X. Zhang, X. Wu, �Image interpolation by adaptive 2D autoregressive modeling and soft-decision estimation�, IEEE Trans. on Image Processing,
% vol. 17, no. 6, pp. 887-896, June 2008. U can get the source code (executable file from here: http://www.ece.mcmaster.ca/~xwu/)
% However, for simplicity, in this code we used the source code of "New Edge-Directed  Interpolation (NEDI) by Xin Li"

% Please cite the following paper if you use this code for research purpose:
% Jaiswal, S.P.; Jakhetiya, V.; Tiwari, A.K., "An efficient image interpolation algorithm based upon the switching and self learned characteristics for natural images," Circuits and Systems (ISCAS),
%2011 IEEE International Symposium on , vol., no., pp.861,864, 15-18 May 2011 doi: 10.1109/ISCAS.2011.5937702
% ---------------------------------------------------------------------------


% Latest modifications: 2011.






clear all


%% Input image of dimension (512X512)

original_image=imread('lena.pgm');
                                                            % THE TIME STARTS NOW
original_image=im2double(original_image);
[org_m, org_n]=size(original_image);                            % SIZE OF THE IMAGE::::::::::::::::::::


%% Existing NEDI Algorithm 

% converion from 512*512 to 256*256:::::::::::::::::::::::::::::::::>>>>>

original_image_256X256 = im2double(zeros(256,256));
original_image_128X128=im2double(zeros(128,128));

for i=1:org_m/2
    for j=1:org_n/2
        original_image_256X256(i,j)=original_image(2*i-1,2*j-1);
    end
end

% conversion from 256*256 to 128*128:::::::::::::::::::::::::::>>>>>>>>>>>

for i=1:org_m/4
    for j=1:org_n/4
        original_image_128X128(i,j)=original_image_256X256(2*i-1,2*j-1);
    end
end

% Algorithm NEDI
tic 
org_sai_big = nedi_demo(original_image); %% USE OF NEDI ALgorithm
org_sai_small = nedi_demo(original_image_256X256); %% USE OF NEDI ALgorithm

%% interpolation of 128*128 to 256*256::::::::::::::::::::::::::>>>>>>>>>>>

predicted_output=im2double(zeros(org_m,org_n));          %%%  THIS IS THE PREDICTED OUTPUT BY SPIA 256*256 TO 512*512
sun_spia_spia=im2double(zeros(org_m/2,org_n/2));         %%%  THIS IS THE PREDICTED OUTPUT BY SPIA 128*128 TO 256*256


for i=1:128
    for j=1:128
        sun_spia_spia(2*i-1,2*j-1)=original_image_128X128(i,j);
    end
end




%% Proposed Algorithm

final_output2 = proposed_algorithm(original_image_256X256,original_image_128X128,sun_spia_spia,org_sai_small,original_image,org_sai_big); % final_output2 is the proposed output
toc

%%  Quality Assesment :
k=imcrop(final_output2,[1 1 org_n-2 org_m-2]);
[a_final2, b_final2]=size(k);
p=imcrop(original_image,[1 1 org_n-2 org_m-2]);
error_image_final2=imsubtract(k , p);
se=(sum(error_image_final2(:).^2));
mse_final2=se/(511*511);
Psnr=10*log10(1/mse_final2)


