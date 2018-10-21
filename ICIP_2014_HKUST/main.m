% Matlab code and data to reproduce results from the paper :::::::::::"EXPLOITATION OF INTER-COLOR CORRELATION FOR COLOR IMAGE DEMOSAICKING" :::::::::::.


% This software is provided for non-commercial and research purposes only.
% This code is written for the clarity of proposed demosaicing algorithm without considering the time complexity.
% Hope it will be useful, but without any warranty. For better understanding of the code, please read the paper first.

% Please cite the following paper if you use this code for research purpose:
% Jaiswal, S.P.; Au, O.C.; Jakhetiya, V.; Yuan Yuan; Haiyan Yang, "Exploitation of inter-color % correlation for color image demosaicking," Image Processing (ICIP), 2014 IEEE International Conference on ,
% vol., no., pp.1812,1816, 27-30 Oct. 2014 doi: 10.1109/ICIP.2014.7025363
% ---------------------------------------------------------------------------


% Latest modifications: July, 2014.



%% 
clear all
clear
close all
tic


%% Initialization

input_im=imread(input('give input full color image --->>'));

input_im=double(input_im);
[m n z]=size(input_im);

R_org=input_im(:,:,1);
G_org=input_im(:,:,2);
B_org=input_im(:,:,3);




%% For initialization, in our method we generate a tentative output from an existing method. There are lot of existing methods that can be used to generate a tentative output.
% In our simulation we used the source code of  “Residual interpolation for color image demosaicking ,” in IEEE Int. Conf. on Image Processing (ICIP), Sept.,2013. 
% Be free to choose any algorithm to generate a tentative output. Better the tentative output, better will be the final result

%     - pattern : mosaic pattern
%           pattern = 'grbg'
%            G R ..
%            B G ..
%            


h = 5;
v = 5;
eps = 0;
rgb=input_im;
pattern = 'grbg';
sigma = 1;


[rgb_tentative]= demosaick(rgb, pattern, sigma);                         %% EXISTING RESIDUAL INTERPOLATION (RI) METHOD, rgb_dem is the reconstructed output from RI Method


%%  For red and blue component
[r_pro_red, PSNR_final_red]= red_lmmse(input_im,rgb_tentative);              %% FOR RECONSTRUCTION OF RED COMPONENT

[r_pro_blue, PSNR_final_blue]= blue_lmmse(input_im,rgb_tentative);       %% FOR RECONSTRUCTION OF GREEN COMPONENT

r_pro_green = rgb_tentative(:,:,2);



%% PSNR STUFF

final_output(:,:,1) = r_pro_red;
final_output(:,:,2) = r_pro_green;
final_output(:,:,3) = r_pro_blue;


PSNR_final_green = PSNR(input_im(:,:,2),rgb_tentative(:,:,2));
psnr = [PSNR_final_red PSNR_final_green PSNR_final_blue];
cpsnr = imcpsnr(input_im, final_output, 255, 10);

fprintf( sprintf( 'Red PSNR:%f\n',     psnr(1)     ) );
fprintf( sprintf( 'Green PSNR:%f\n',   psnr(2)     ) );
fprintf( sprintf( 'Blue PSNR:%f\n',    psnr(3)     ) );
fprintf( sprintf( '::::: CPSNR ::::::::%f\n',   cpsnr       ) );



toc


