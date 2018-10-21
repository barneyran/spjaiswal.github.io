% Matlab code and data to reproduce results from the paper :::::::::::
% "A Low Complex Context Adaptive Image Interpolation Algorithm For Real-Time Applications"


% This software is provided for non-commercial and research purposes only.
% This code is written for the clarity of proposed algorithm without
% considering the time complexity. Due to lack of time, This algorithm is designed for 512X512 image only.
% Hope it will be useful, but without any warranty. For better understanding of the code, please read the paper first.


% Please cite the following paper if you use this code for research purpose:
% Sunil Prasad Jaiswal, Vinit Jakhetiya, Ayush Kumar, Anil K. Tiwari "A Low Complex Context Adaptive Image Interpolation Algorithm For Real-Time Applications ,
%" Instrumentation and Measurement Technology Conference (I2MTC), 2012 IEEE International , vol., no., pp.969,972, 13-16 May 2012 doi: 10.1109/I2MTC.2012.6229348
% ---------------------------------------------------------------------------


%% This is Content Independent based interpolation algorithm


clear all
original_image=imread('lena.pgm');


%% Initialization
s=double(original_image); 
[m n]=size(s);

%downsampling  
 for i=1:m/2
     for j=1:n/2
         y1(i,j)=s(2*i-1,2*j-1);
     end
 end
 
 
 %% Proposed Algorithm
  
output =  proposed_algorithm_independent(s,y1);



%% Quality assesment

psnr_our = PSNR(s,output)


