clc;
clear;
[baseFileName,folder]=uigetfile('*.*','Select the line image file');
% Getting the full filename
a = fullfile(folder, baseFileName);
b=imread(a);
grayim=rgb2gray(b);
binaryim=grayim<210;
count=0;
len=1;
middle=0;
x=1;
y=1;
for i=1:size(binaryim,1)
    for j=1:size(binaryim,2)
        if(binaryim(i,j)==1)
          count=count+1;  
        end
    end  
    storecount(len,1)=count;
    count=0;
    len=len+1;
end
for i=1:size(storecount)
    if (storecount(i)==size(binaryim,2))
        middle=i;
        if(storecount(i-1)==0 | storecount(i+1)==0)
            display('present');
        end
    end
end
%now separeting both the digits
for i=1:(middle-2)
    for j=1:size(grayim,2)
        croppedimage1(i,j)=grayim(i,j);
    end
end
for i=(middle+1):size(grayim,1)
    for j=1:size(binaryim,2)
        croppedimage2(x,y)=grayim(i,j);
        y=y+1;
    end
    x=x+1;
    y=1;
end
    imshow(croppedimage1);
    row=1;
    path='D:/images/sep_char/';
    %iname=int2str(row);
    cmap=colormap('gray');
    iname=strcat(path,'1.jpeg');
    imwrite(croppedimage1,cmap,iname,'jpeg');
    row=2;
    path='D:/images/sep_char/';
    %iname=int2str(row);
    cmap=colormap('gray');
    iname=strcat(path,'2.jpeg');
    imwrite(croppedimage2,cmap,iname,'jpeg');
    


        