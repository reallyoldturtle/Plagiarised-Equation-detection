function pic2ocra()
clc;
fid = fopen('D:\a.txt', 'wt');
fclose(fid);
fileloc='D:\images\equations\characters\*.jpeg';
loc='D:\images\equations\characters\';
array_file=dir(fileloc);
for i=1:size(array_file);
tempvar=strtok(array_file(i).name,'x');
t2=str2num(tempvar);
split_arr(i)=t2;
end
disp(split_arr);
%----------- sending names back to ocr
counter=1;
flag='t';
imname=strcat(int2str(split_arr(1)),'x','1','.jpeg');
 for i=1:size(split_arr,2)
     if ((i>1) & (split_arr(i-1)-split_arr(i) == 0))
         imname=strcat(int2str(split_arr(i)),'x',int2str(counter),'.jpeg');
     else if((i>1) & (split_arr(i-1)-split_arr(i) ~= 0)) 
         counter=1;
         imname=strcat(int2str(split_arr(i)),'x',int2str(counter),'.jpeg');   
         end
     end
   if(counter==1)
       flag='f';
   else
       flag='t';
   end
   ocr(loc,imname,flag);
   counter=counter+1;
 end
end
 
