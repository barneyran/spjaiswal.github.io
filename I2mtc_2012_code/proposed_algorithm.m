function y = proposed_algorithm(x,y,y1)

[m n]=size(x);
  P=m;
  p=n;
   ayu=0;a1=0;a2=0;a3=0;a4=0;a5=0;a6=0;a7=0;a8=0; e1(1:8)=0.25;
   %% This particular coding in this area is for switching the value of parameters.
   
     
   for I=1:p:m/2
     for J=1:p:n/2
         
     for i=2*I:2*I+1*P
     for j=2*J:2*J+1*P
         
         if mod(i,2)==0 && mod (j,2)==0
             
              if (i-3)>0 && j>3 && (i+3)<512/1 && (j+3)<512/1
             
             s36=abs(y(i+1,j-1)-y(i-1,j+1))+abs(y(i+1,j-1)-y(i+3,j-3))+abs(y(i-1,j+1)-y(i-3,j+3));
             
             
             s135=abs(y(i-1,j-1)-y(i-3,j-3))+abs(y(i-1,j-1)-y(i+1,j+1))+abs(y(i+1,j+1)-y(i+3,j+3));
        
         
         diff=s36-s135;
         
       if diff>=40
           ayu=ayu+1;
           
           y(i,j)=y(i-1,j-1)*e1(1)+y(i-1,j+1)*e1(2)+y(i+1,j-1)*e1(3)+y(i+1,j+1)*e1(4);
       end
              end
         end
     end
     end
     end
   end
   
   % Here switching part is over.
   %%
  
 if ayu>5000      
  
   for I=1:p:m/2
     for J=1:p:n/2
         
         for i=I:I+P/2
     for j=J:J+P/2
         
         if (i-3)>0 && j>3 && (i+3)<512/2 && (j+3)<512/2
             
             s36=abs(y1(i+1,j-1)-y1(i-1,j+1))+abs(y1(i+1,j-1)-y1(i+3,j-3))+abs(y1(i-1,j+1)-y1(i-3,j+3));
             
             
             s135=abs(y1(i-1,j-1)-y1(i-3,j-3))+abs(y1(i-1,j-1)-y1(i+1,j+1))+abs(y1(i+1,j+1)-y1(i+3,j+3));
        
         
         diff=s36-s135;
         
         end
     end
         end
%% Parameters to be used for switching
 
 e1(1)=.2791;
 e1(2)=.2060;
 e1(3)=.1968;
 e1(4)=.3155;
 
 
 e2(1)=.2446;
 e2(2)=.2519;
 e2(3)=.2587;
 e2(4)=.2373;
 
 
 e3(1)=.2880;
 e3(2)=.2177;
 e3(3)=.2389;
 e3(4)=.2560;
 
 
 e4(1)=.2859;
 e4(2)=.2242;
 e4(3)=.2318;
 e4(4)=.2554;
 
 
 e5(1)=.2900;
 e5(2)=.1983;
 e5(3)=.2286;
 e5(4)=.2835;
 
 
 e6(1)=.3096;
 e6(2)=.1763;
 e6(3)=.2271;
 e6(4)=.2796;
 
 
 
 e7(1)=.2715;
 e7(2)=.2575;
 e7(3)=.2398;
 e7(4)=.2326;
 
 
 e8(1)=.2670;
 e8(2)=.2325;
 e8(3)=.2623;
 e8(4)=.2417;
 
 
  for i=2*I:2*I+1*P
     for j=2*J:2*J+1*P
         
         if mod(i,2)==0 && mod (j,2)==0
             
              if (i-3)>0 && j>3 && (i+3)<512/1 && (j+3)<512/1
             
             s36=abs(y(i+1,j-1)-y(i-1,j+1))+abs(y(i+1,j-1)-y(i+3,j-3))+abs(y(i-1,j+1)-y(i-3,j+3));
             
             
             s135=abs(y(i-1,j-1)-y(i-3,j-3))+abs(y(i-1,j-1)-y(i+1,j+1))+abs(y(i+1,j+1)-y(i+3,j+3));
        
         
         diff=s36-s135;
         
       if diff>=40
           a1=a1+1;
           
           y(i,j)=y(i-1,j-1)*e1(1)+y(i-1,j+1)*e1(2)+y(i+1,j-1)*e1(3)+y(i+1,j+1)*e1(4);
       end
           
            
           
       if diff<=-40
           a2=a2+1;
           
           y(i,j)=y(i-1,j-1)*e2(1)+y(i-1,j+1)*e2(2)+y(i+1,j-1)*e2(3)+y(i+1,j+1)*e2(4);
       end
       
            if diff>8 && diff <20
            a3=a3+1;
                
           y(i,j)=y(i-1,j-1)*e3(1)+y(i-1,j+1)*e3(2)+y(i+1,j-1)*e3(3)+y(i+1,j+1)*e3(4);
            end
           
        if diff>-40 && diff <=-20
           a4=a4+1;
           y(i,j)=y(i-1,j-1)*e4(1)+y(i-1,j+1)*e4(2)+y(i+1,j-1)*e4(3)+y(i+1,j+1)*e4(4);
       end
           
        if diff>-8 && diff <=0
            a5=a5+1;
           
           y(i,j)=y(i-1,j-1)*e5(1)+y(i-1,j+1)*e5(2)+y(i+1,j-1)*e5(3)+y(i+1,j+1)*e5(4);
        end
           
        if diff>=20 && diff<40
           a6=a6+1;
           
           y(i,j)=y(i-1,j-1)*e6(1)+y(i-1,j+1)*e6(2)+y(i+1,j-1)*e6(3)+y(i+1,j+1)*e6(4);
%           vin1=vin1+1;
        end
           
        if diff>-20 && diff <=-8
%           vin2=vin2+1;
            a7=a7+1;
            
           y(i,j)=y(i-1,j-1)*e7(1)+y(i-1,j+1)*e7(2)+y(i+1,j-1)*e7(3)+y(i+1,j+1)*e7(4);
        end
           
        if diff>0 && diff <=8
           a8=a8+1;
            
           y(i,j)=y(i-1,j-1)*e8(1)+y(i-1,j+1)*e8(2)+y(i+1,j-1)*e8(3)+y(i+1,j+1)*e8(4);
       end
              end
         end
     end
 end
     end
  end
 
 
 for I=1:P:m/2
     for J=1:P:n/2
         
         
         for i=I:I+P/2 
     for j=J:J+P/2
         
         if (i-3)>0 && j>3 && (i+3)<512/2 && (j+3)<512/2
             
             sver=abs(y1(i-1,j)-y1(i-3,j))+abs(y1(i-1,j)-y1(i+1,j))+abs(y1(i+1,j)-y1(i+3,j));
             
             
             shor=abs(y1(i,j-3)-y1(i,j-1))+abs(y1(i,j-1)-y1(i,j+1))+abs(y1(i,j+1)-y1(i,j+3));
        
         
         diff=sver-shor;
         
          end
     end
         end
 
 
 e21(1)=0.2748;
 e21(2)=0.2327;
 e21(3)=0.2723;
 e21(4)=0.2253;
 
 
 e22(1)=0.2246;
 e22(2)=0.2765;
 e22(3)=0.2185;
 e22(4)=0.2807;
 
 
 
 e23(1)=0.2586;
 e23(2)=0.2139;
 e23(3)=0.2734;
 e23(4)=0.2565;
 

  
 e24(1)=-0.0201;
 e24(2)=0.2925;
 e24(3)=0.3402;
 e24(4)=0.3875;



 e25(1)=.2434;
 e25(2)=.2788;
 e25(3)=.2371;
 e25(4)=.2450;

 
  %e26(1:4)=.25;
  
  e26(1)=.2680;
  e26(2)=.1926;
  e26(3)=.3223;
  e26(4)=.2208;
  
  e27(1)=.2947;
  e27(2)=.1896;
  e27(3)=.2532;
  e27(4)=.2620;
  
  e28(1)=-0.0188;
  e28(2)=.2954;
  e28(3)=.3779;
  e28(4)=.3382;
   
   
 for i=2*I:2*I+2*P/2
     for j=2*J:2*J+2*P/2
         
         if mod(i,2)==0 && mod (j,2)~=0
             
              if (i-3)>0 && j>3 && (i+3)<512/1 && (j+3)<512/1
             
          sver=abs(y(i-1,j)-y(i-3,j))+abs(y(i-1,j)-y(i+1,j))+abs(y(i+1,j)-y(i+3,j));
             
             
             shor=abs(y(i,j-3)-y(i,j-1))+abs(y(i,j-1)-y(i,j+1))+abs(y(i,j+1)-y(i,j+3));
        
         
         diff=sver-shor;
         
   
         
       if diff>=40
           a1=a1+1;
           
           y(i,j)=y(i,j-1)*e21(1)+y(i-1,j)*e21(2)+y(i,j+1)*e21(3)+y(i+1,j)*e21(4);
       end
           
            
           
       if diff<=-40
           a2=a2+1;
           
           y(i,j)=y(i,j-1)*e22(1)+y(i-1,j)*e22(2)+y(i,j+1)*e22(3)+y(i+1,j)*e22(4);
       end
       
            if diff>=8 && diff <20
           a3=a3+1;
           
           y(i,j)=y(i,j-1)*e23(1)+y(i-1,j)*e23(2)+y(i,j+1)*e23(3)+y(i+1,j)*e23(4);
            end
           
        if diff>-40 && diff <=-20
           a4=a4+1;
           
           y(i,j)=y(i,j-1)*e24(1)+y(i-1,j)*e24(2)+y(i,j+1)*e24(3)+y(i+1,j)*e24(4);
       end
           
        if diff>=-8 && diff <0
           a5=a5+1;
           
           
          y(i,j)=y(i,j-1)*e25(1)+y(i-1,j)*e25(2)+y(i,j+1)*e25(3)+y(i+1,j)*e25(4);
        end
           
        if diff>20 && diff<40
          % jak1=jak1+1;
          a6=a6+1; 
          
          y(i,j)=y(i,j-1)*e26(1)+y(i-1,j)*e26(2)+y(i,j+1)*e26(3)+y(i+1,j)*e26(4);
        end
           
        if diff>-20 && diff <-8
%           jak2=jak2+1;
            a7=a7+1;

        y(i,j)=y(i,j-1)*e27(1)+y(i-1,j)*e27(2)+y(i,j+1)*e27(3)+y(i+1,j)*e27(4);
        end
           
        if diff>=0 && diff <8
           a8=a8+1;
           
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
           a1=a1+1;
           
           y(i,j)=y(i,j-1)*e21(1)+y(i-1,j)*e21(2)+y(i,j+1)*e21(3)+y(i+1,j)*e21(4);
       end
           
            
           
       if diff<=-40
           a2=a2+1;
           
           y(i,j)=y(i,j-1)*e22(1)+y(i-1,j)*e22(2)+y(i,j+1)*e22(3)+y(i+1,j)*e22(4);
       end
       
            if diff>=8 && diff <20
                a3=a3+1;
                
           y(i,j)=y(i,j-1)*e23(1)+y(i-1,j)*e23(2)+y(i,j+1)*e23(3)+y(i+1,j)*e23(4);
            end
           
        if diff>-40 && diff <=-20
                a4=a4+1;
                
           y(i,j)=y(i,j-1)*e24(1)+y(i-1,j)*e24(2)+y(i,j+1)*e24(3)+y(i+1,j)*e24(4);
       end
           
        if diff>=-8 && diff <0
            a5=a5+1;
            
           
          y(i,j)=y(i,j-1)*e25(1)+y(i-1,j)*e25(2)+y(i,j+1)*e25(3)+y(i+1,j)*e25(4);
        end
           
        if diff>=20 && diff<40
           a6=a6+1;
           
           y(i,j)=y(i,j-1)*e26(1)+y(i-1,j)*e26(2)+y(i,j+1)*e26(3)+y(i+1,j)*e26(4);
        end
           
        if diff>-20 && diff <-8
           a7=a7+1;
           
           y(i,j)=y(i,j-1)*e27(1)+y(i-1,j)*e27(2)+y(i,j+1)*e27(3)+y(i+1,j)*e27(4);
        end
           
        if diff>=0 && diff <8
           a8=a8+1;
           
           y(i,j)=y(i,j-1)*e28(1)+y(i-1,j)*e28(2)+y(i,j+1)*e28(3)+y(i+1,j)*e28(4);
       end
              end
         end
         
         
     end
 end
       
     end
 end
 
 else
     
for I=1:p:m/2
     for J=1:p:n/2


 for i=I:I+P/2
     for j=J:J+P/2
         
         if (i-3)>0 && j>3 && (i+3)<512/2 && (j+3)<512/2
             
             s36=abs(y1(i+1,j-1)-y1(i-1,j+1))+abs(y1(i+1,j-1)-y1(i+3,j-3))+abs(y1(i-1,j+1)-y1(i-3,j+3));
             
             
             s135=abs(y1(i-1,j-1)-y1(i-3,j-3))+abs(y1(i-1,j-1)-y1(i+1,j+1))+abs(y1(i+1,j+1)-y1(i+3,j+3));
        
         
         diff=s36-s135;
         
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
           a1=a1+1;
           
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
     end
 end
 
 
 for I=1:P:m/2
     for J=1:P:n/2
 
sumXD8=0;
 for i=I:I+P/2 
     for j=J:J+P/2
         
         if (i-3)>0 && j>3 && (i+3)<512/2 && (j+3)<512/2
             
             sver=abs(y1(i-1,j)-y1(i-3,j))+abs(y1(i-1,j)-y1(i+1,j))+abs(y1(i+1,j)-y1(i+3,j));
             
             
             shor=abs(y1(i,j-3)-y1(i,j-1))+abs(y1(i,j-1)-y1(i,j+1))+abs(y1(i,j+1)-y1(i,j+3));
        
         
         diff=sver-shor;
        
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
 end
 end