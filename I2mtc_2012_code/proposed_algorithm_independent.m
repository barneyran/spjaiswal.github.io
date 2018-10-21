function output = proposed_algorithm_independent(s,y1)
 [m n]=size(s);
 edgy_i=double(zeros(m,n));
 smooth_i=double(zeros(m,n));
 
 edgy_i(1:3,1:n)=s(1:3,1:n);
 
 edgy_i(1:m,1:3)=s(1:m,1:3);
 
 edgy_i(1:m,509:512)=s(1:m,509:512);
 
 edgy_i(509:512,1:n)=s(509:512,1:n);
 
 
 smooth_i(1:3,1:n)=s(1:3,1:n);
 
 smooth_i(1:m,1:3)=s(1:m,1:3);
 
 smooth_i(1:m,509:512)=s(1:m,509:512);
 
 smooth_i(509:512,1:n)=s(509:512,1:n);

 [row col]=size(y1);

 output=double(zeros(m,n));


edgy_i=edgy(y1,edgy_i);


psnr_edgy = PSNR(s,edgy_i);

smooth_i=smooth(y1,smooth_i);

psnr_smooth=  PSNR(s,smooth_i);

%% Calculating edges
 pp=0;
 mm = 256*256/(16*16);                                  %% No. of blocks
                                                                                                                                                                                                                                                                                     
for i=1:16:256     
    for j=1:16:256
            
             pp=pp+1;
             
             BW(pp) = edge(y1(i:i+15,j:j+15)) ;      %% Percentage of edge is stored in BW
             
% %      
%     
             
    end
%     
end
% 
%% switching


count = 0;
pp=0;

for i=1:32:512     
    for j=1:32:512
            
pp = pp + 1;
     
if BW(pp) > 49.777
   
                
    output(i:i+31,j:j+31)= edgy_i(i:i+31,j:j+31);

    count = count + 1;
    
else
        output(i:i+31,j:j+31)= smooth_i(i:i+31,j:j+31);  
 
end

    end
end
end
