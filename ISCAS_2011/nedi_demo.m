
function y = nedi_demo(x1)
% main program to demonstrate how NEDI works
% Author: Xin Li
% Reference: New edge-directed interpolation 
% Li, X and Orchard, M T 
% IEEE Transactions on Image Processing. Vol. 10, no. 10, pp. 1521-1527. Oct. 2001 

% x1=im2double(imread(input('give image')));
%x1=rgb2gray(x1);
[m n]=size(x1);
for i=1:m/2
     for j=1:n/2
         x(i,j)=x1(2*i-1,2*j-1);      % x is the LR image 
     end
end 
 
    y(:,:)=sri(x(:,:),1);
    
end