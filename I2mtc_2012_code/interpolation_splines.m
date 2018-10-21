function z2= interpolation_splines(i);

%i=imread(input('give image which u wanna interpolate'));
%i=rgb2gray(i);
[m n]=size(i);


f=min(m,n);
l=uint8(zeros(f/2,f/2));
u=uint8(zeros(f-1,f-1));
for k=1:f /2
    for j=1:f/2
        l(k,j)=i(2*k-1,2*j-1);
    end
end
vii=imresize(l,2,'bicubic');
%figure,imshow(vii);
for k=1:f-1
    for j=1:f-1
        u(k,j)=i(k,j);
    end
end
%imshow(l);
[X Y]=meshgrid(1:f/2);
[X1 Y1]=meshgrid(1:.5:f/2);


l=im2double(l);
z1=interp2(X,Y,l,X1,Y1,'linear');

%figure,imshow(im2uint8(z1)),title('linear');
z2=interp2(X,Y,l,X1,Y1,'cubic');

%figure,imshow(im2uint8(z2)),title('cubic');
z3=interp2(X,Y,l,X1,Y1,'spline');

%figure,imshow(im2uint8(z3)),title('spline');

%w=u-im2uint8(z1);
%figure,imshow(w),title('check,linear');
%w=u-im2uint8(z2);
% figure,imshow(w),title('check,cubic');
% w=u-im2uint8(z3);
% figure,imshow(w),title('check,spline');
g=imcrop(z1,[70 170 220 250]);
%imwrite(g,'bilinearsplineparrot.jpg');



i=im2double(i);
vii=im2double(vii);


z2(512,512)=z2(511,511);
z2(512,:)=z2(511,:);
z2(:,512)=z2(:,511);
[bb,nn]=size(z2);
 y=imcrop(z2,[1 1 n-1 m-1]);
p=imcrop(i,[1 1 n-1 m-1]);
imwrite(z2,'check2.pgm');
%imshow(y-p)
[c d]=size(p);
size(p);
e=imsubtract(y,p);
se=(sum(e(:).^2));
mse=se/(c*d);
psnr=10*log10(1/mse);
%imtool(y);
