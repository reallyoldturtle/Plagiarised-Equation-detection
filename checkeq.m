clc,clear
folder = 'D:\images\strips\';
baseFileName = '1.jpeg';
% Getting the full filename
fullFileName = fullfile(folder, baseFileName);
grayImage = imread(fullFileName);
gr=rgb2gray(grayImage);
b=gr<210;
flag=0;
si=1;
sj=1;
%gettin the start points of a continuos 1s in two arrays (i.e X and Y
%values)
for i=1:size(b,1)
    for j=1:(size(b,2))
        if(b(i,j)==1) 
            flag=1;
            for k=j:j+8
                if(b(i,k)==0)
                    flag=0;
                    break;
                end
            end
            
            if (flag==1)
                j=j+1;
            storeval(si,1)=i;
            storeval(si,2)=j;
            si=si+1;
            end   %end of flag==1 
            end
        end
end
storevalsort=(sortrows(storeval,2));
flag=1;
for i=1:size(storevalsort,1)-1
   if (storevalsort(i,2)==storevalsort(i+1,2))
       if(storevalsort(i+1,1)-storevalsort(i,1)>1)
           %condition satisfied for cheking of complete
           %blanks in between two parallel lines
           for j=storevalsort(i,1)+1:storevalsort(i+1,1)-1
               for k=storevalsort(i,2):storevalsort(i,2)+8
                   if (b(j,k)==1)
                       flag=0;
                   end
               end
           end
           if(flag==1)
          %display(storevalsort(i,1));
          display('present');
           end
           flag=1;
       end
   end
end

imshow(b);