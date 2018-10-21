function yy=edge(i)

j=[1 2 1; 0 0 0; -1 -2 -1];     %%Scharr operator
% i=imread(input('give image'));
%  i=im2double(i);
 k=conv2(i,j);
 %figure,imshow(k);
 v=0;
 [m n]=size(k);  %this is edge images
%  k=imcrop(k,[5 5 m-9 n-9]);
I=1;
J=1;
% k
 for q=1 : m
     for w=1 : n
 if abs(k(q,w))>128
    v=v+1;
 end
 g(q,w)=k(q,w);
     end
 end
 
% imtool(g);
yy=v*100/(m*n);
 
 
 
