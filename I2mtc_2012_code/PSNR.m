function p = PSNR(ip,op)

op = imcrop(op,[4 4 509 509]);
[m n]=size(op);

ip = imcrop(ip,[4 4 509 509]);


[a b]=size(ip);

e=imsubtract(op,ip);

se=(sum(e(:).^2));

mse=se/(a*b);

psnr=10*log10(255*255/mse);

p = psnr;
end