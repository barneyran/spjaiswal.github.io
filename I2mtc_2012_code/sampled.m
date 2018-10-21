clc
clear all

v=imread(input('Give Image--->'));
[m n]=size(v);

for i=1:m/2
     for j=1:n/2
         y(i,j)=v(2*i-1,2*j-1);
     end
end
 imshow(y);
 size(y)
 
 c= imresize(y,2,'bicubic');
 imshow(c);
 
 [a b]=size(v);
e=imsubtract(c,v);
se=(sum(e(:).^2));
mse=se/(a*b);
psnr=10*log10(255*255/mse)