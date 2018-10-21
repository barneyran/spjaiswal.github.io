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


% Latest modifications: 2012.

%% This is Content dependent based interpolation algorithm




clear all
original_image=imread('lena.pgm');

%% Intialization

x=double(original_image); 
[m n]=size(x);
 
  
 for i=1:m/2
     for j=1:n/2
         y1(i,j)=x(2*i-1,2*j-1);
     end
 end  
 
  y=double(zeros(m,n));
 
 % here filling of odd rows and odd coloumn of y
 for i=1:m/2
     for j=1:n/2
         y(2*i-1,2*j-1)=y1(i,j);
     end
 end
%% Calling Proposed Algorithm
 
y =  proposed_algorithm(x,y,y1);
 
%% quality Assesment
 
  tt=interpolation_splines(original_image);
 tt=im2uint8(tt);
 tt=double(tt);
y(1:3,:)=tt(1:3,:);
y(509:512,:)=tt(509:512,:);

y(:,1:3)=tt(:,1:3);
y(:,509:512)=tt(:,509:512);
[a b]=size(x);
e=imsubtract(y,x);
se=(sum(e(:).^2));
mse=se/(a*b);
psnr=10*log10(255*255/mse)


     
     