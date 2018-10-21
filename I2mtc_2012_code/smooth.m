function sm=smooth(y1,y);
% [m n]=size(y1);
% 
% y=double(zeros(2*m,2*n));
[m n]=size(y);

for i=1:m/2
     for j=1:n/2
         y(2*i-1,2*j-1)=y1(i,j);
     end
 end
 
  P=m;
  p=n;
 for I=1:p:m/2
     for J=1:p:n/2
         for i=I:I+P/2
           for j=J:J+P/2
         
         if (i-3)>0 && j>3 && (i+3)<512/2 && (j+3)<512/2
             
             s36=abs(y1(i+1,j-1)-y1(i-1,j+1))+abs(y1(i+1,j-1)-y1(i+3,j-3))+abs(y1(i-1,j+1)-y1(i-3,j+3));
             
             
             s135=abs(y1(i-1,j-1)-y1(i-3,j-3))+abs(y1(i-1,j-1)-y1(i+1,j+1))+abs(y1(i+1,j+1)-y1(i+3,j+3));
        
         
         diff=s36-s135;
         %first bun
         
         end
     end
         end
 
 
 e1(1)=0.3151;
 e1(2)=.178;
 e1(3)=.18075;
 e1(4)=.3272;
 
 e2(1)=0.1533;
 e2(2)=0.3555;
 e2(3)=0.3455;
 e2(4)=0.14685;
 
 e3(1)=0.2881;
 e3(2)=0.2123;
 e3(3)=0.2156;
 e3(4)=0.2845;

 e4(1)=0.19435;
 e4(2)=0.30145;
 e4(3)=0.30685;
 e4(4)=0.19805;
 
 e5(1)=0.2243;
 e5(2)=0.2781;
 e5(3)=0.2793;
 e5(4)=0.21885;
 
 e6(1)=0.2295;
 e6(2)=0.25455;
 e6(3)=0.26985;
 e6(4)=0.2464;
 
 e7(1)=0.2412;
 e7(2)=0.25705;
 e7(3)=0.25245;
 e7(4)=0.24855;
 
 e8(1)=0.2573;
 e8(2)=0.2411;
 e8(3)=0.2368;
 e8(4)=0.26515;
 
 for i=2*I:2*I+1*P
     for j=2*J:2*J+1*P
         
         if mod(i,2)==0 && mod (j,2)==0
             
              if (i-3)>0 && j>3 && (i+3)<512/1 && (j+3)<512/1
             
             s36=abs(y(i+1,j-1)-y(i-1,j+1))+abs(y(i+1,j-1)-y(i+3,j-3))+abs(y(i-1,j+1)-y(i-3,j+3));
             
             
             s135=abs(y(i-1,j-1)-y(i-3,j-3))+abs(y(i-1,j-1)-y(i+1,j+1))+abs(y(i+1,j+1)-y(i+3,j+3));
        
         
         diff=s36-s135;
         
       if diff>=40
           
           y(i,j)=y(i-1,j-1)*e1(1)+y(i-1,j+1)*e1(2)+y(i+1,j-1)*e1(3)+y(i+1,j+1)*e1(4);
       end
           
            
           
       if diff<=-40
           
           y(i,j)=y(i-1,j-1)*e2(1)+y(i-1,j+1)*e2(2)+y(i+1,j-1)*e2(3)+y(i+1,j+1)*e2(4);
       end
       
            if diff>=20 && diff <40
           
           y(i,j)=y(i-1,j-1)*e3(1)+y(i-1,j+1)*e3(2)+y(i+1,j-1)*e3(3)+y(i+1,j+1)*e3(4);
            end
           
        if diff>-40 && diff <=-20
           
           y(i,j)=y(i-1,j-1)*e4(1)+y(i-1,j+1)*e4(2)+y(i+1,j-1)*e4(3)+y(i+1,j+1)*e4(4);
       end
           
        if diff>-20 && diff <=-8
            
           
           y(i,j)=y(i-1,j-1)*e5(1)+y(i-1,j+1)*e5(2)+y(i+1,j-1)*e5(3)+y(i+1,j+1)*e5(4);
        end
           
        if diff>-8 && diff<=0
           
           y(i,j)=y(i-1,j-1)*e6(1)+y(i-1,j+1)*e6(2)+y(i+1,j-1)*e6(3)+y(i+1,j+1)*e6(4);
%           vin1=vin1+1;
        end
           
        if diff>0 && diff <=8
%           vin2=vin2+1;
           y(i,j)=y(i-1,j-1)*e7(1)+y(i-1,j+1)*e7(2)+y(i+1,j-1)*e7(3)+y(i+1,j+1)*e7(4);
        end
           
        if diff>8 && diff <=20
           
           y(i,j)=y(i-1,j-1)*e8(1)+y(i-1,j+1)*e8(2)+y(i+1,j-1)*e8(3)+y(i+1,j+1)*e8(4);
       end
              end
         end
     end
 end
   
 
 e21(1)=0.34805;
 e21(2)=0.1501;
 e21(3)=0.35185;
 e21(4)=0.1516;
 
 e22(1)=0.23155;
 e22(2)=.2704;
 e22(3)=0.23085;
 e22(4)=0.26875;

 e23(1)=0.3096;
 e23(2)=0.1854;
 e23(3)=0.3125;
 e23(4)=0.1934;
 
 %e24(1:4)=0.25;
  e24(1)=.1742;
 e24(2)=0.305;
 e24(3)=0.21795;
 e24(4)=0.30295;
 
%e25(1:4)=.25;

  e25(1)=0.1976;
 e25(2)=.30085;
 e25(3)=.19325;
 e25(4)=.30855;

 %e26(1:4)=.25;
 
 e26(1)=0.21975;
 e26(2)=.28485;
 e26(3)=.21975;
 e26(4)=.27575;

 
 %e27(1:4)=.25;
 e27(1)=0.23225;
 e27(2)=.27035;
 e27(3)=.2358;
 e27(4)=.2620;

 %e28(1:4)=.25;
 e28(1)=.1243;
 e28(2)=.31685;
 e28(3)=.2326;
 e28(4)=.32645;

  for i=2*I:2*I+2*P/2
     for j=2*J:2*J+2*P/2
         
         if mod(i,2)==0 && mod (j,2)~=0
             
              if (i-3)>0 && j>3 && (i+3)<512/1 && (j+3)<512/1
             
          sver=abs(y(i-1,j)-y(i-3,j))+abs(y(i-1,j)-y(i+1,j))+abs(y(i+1,j)-y(i+3,j));
             
             
             shor=abs(y(i,j-3)-y(i,j-1))+abs(y(i,j-1)-y(i,j+1))+abs(y(i,j+1)-y(i,j+3));
        
         
         diff=sver-shor;
         
   
         
       if diff>=40
           
           y(i,j)=y(i,j-1)*e21(1)+y(i-1,j)*e21(2)+y(i,j+1)*e21(3)+y(i+1,j)*e21(4);
       end
           
            
           
       if diff<=-40
           
           y(i,j)=y(i,j-1)*e22(1)+y(i-1,j)*e22(2)+y(i,j+1)*e22(3)+y(i+1,j)*e22(4);
       end
       
            if diff>=20 && diff <40
           
           y(i,j)=y(i,j-1)*e23(1)+y(i-1,j)*e23(2)+y(i,j+1)*e23(3)+y(i+1,j)*e23(4);
            end
           
        if diff>-40 && diff <=-20
           
           y(i,j)=y(i,j-1)*e24(1)+y(i-1,j)*e24(2)+y(i,j+1)*e24(3)+y(i+1,j)*e24(4);
       end
           
        if diff>-20 && diff <=-8
            
           
          y(i,j)=y(i,j-1)*e25(1)+y(i-1,j)*e25(2)+y(i,j+1)*e25(3)+y(i+1,j)*e25(4);
        end
           
        if diff>-8 && diff<=0
          % jak1=jak1+1;
           y(i,j)=y(i,j-1)*e26(1)+y(i-1,j)*e26(2)+y(i,j+1)*e26(3)+y(i+1,j)*e26(4);
        end
           
        if diff>0 && diff <=8
%           jak2=jak2+1;
           y(i,j)=y(i,j-1)*e27(1)+y(i-1,j)*e27(2)+y(i,j+1)*e27(3)+y(i+1,j)*e27(4);
        end
           
        if diff>8 && diff <=20
           
           y(i,j)=y(i,j-1)*e28(1)+y(i-1,j)*e28(2)+y(i,j+1)*e28(3)+y(i+1,j)*e28(4);
       end
              end
         end
         
         if mod(i,2)~=0 && mod (j,2)==0
             
              if (i-3)>0 && j>3 && (i+3)<512/1 && (j+3)<512/1
             
          sver=abs(y(i-1,j)-y(i-3,j))+abs(y(i-1,j)-y(i+1,j))+abs(y(i+1,j)-y(i+3,j));
             
             
             shor=abs(y(i,j-3)-y(i,j-1))+abs(y(i,j-1)-y(i,j+1))+abs(y(i,j+1)-y(i,j+3));
        
         
         diff=sver-shor;
         
   
         
       if diff>=40
           
           y(i,j)=y(i,j-1)*e21(1)+y(i-1,j)*e21(2)+y(i,j+1)*e21(3)+y(i+1,j)*e21(4);
       end
           
            
           
       if diff<=-40
           
           y(i,j)=y(i,j-1)*e22(1)+y(i-1,j)*e22(2)+y(i,j+1)*e22(3)+y(i+1,j)*e22(4);
       end
       
            if diff>=20 && diff <40
           
           y(i,j)=y(i,j-1)*e23(1)+y(i-1,j)*e23(2)+y(i,j+1)*e23(3)+y(i+1,j)*e23(4);
            end
           
        if diff>-40 && diff <=-20
           
           y(i,j)=y(i,j-1)*e24(1)+y(i-1,j)*e24(2)+y(i,j+1)*e24(3)+y(i+1,j)*e24(4);
       end
           
        if diff>-20 && diff <=-8
            
           
          y(i,j)=y(i,j-1)*e25(1)+y(i-1,j)*e25(2)+y(i,j+1)*e25(3)+y(i+1,j)*e25(4);
        end
           
        if diff>-8 && diff<=0
           
           y(i,j)=y(i,j-1)*e26(1)+y(i-1,j)*e26(2)+y(i,j+1)*e26(3)+y(i+1,j)*e26(4);
        end
           
        if diff>0 && diff <=8
           
           y(i,j)=y(i,j-1)*e27(1)+y(i-1,j)*e27(2)+y(i,j+1)*e27(3)+y(i+1,j)*e27(4);
        end
           
        if diff>8 && diff <=20
           
           y(i,j)=y(i,j-1)*e28(1)+y(i-1,j)*e28(2)+y(i,j+1)*e28(3)+y(i+1,j)*e28(4);
       end
              end
         end
         
         
     end
 end
     end
 end
 
sm=y;
     end