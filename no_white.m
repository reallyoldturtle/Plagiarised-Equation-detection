function no_white(im,nameim)

grayim=im
%elimintaing faded areas
for i=1:size(grayim,1)
    for j=1:size(grayim,2)
        if(grayim(i,j)<50)
            grayim(i,j)=0;
        end
    end
end
%display(size(grayim));
binaryim=grayim<210;
%display(binaryim);
%%%%%%%%%%%%%%%%%removing whitespace%%%%%%%%%%%%%%%%%%%%%%%%%%
uppos=2;
flag=1;
for i=1:size(binaryim,1)
    for j=1:size(binaryim,2)
        if(flag==1)
        if(binaryim(i,j)==1)
            uppos=i-1;
            flag=0;
            break;
        end
        end
    end
    if (flag==0)
        break;
    end
end
flag=1;
downpos=1;
for i=size(binaryim,1):-1:1
    for j=size(binaryim,2):-1:1
        if(flag==1)
        if(binaryim(i,j)==1)
            downpos=i+1;
            flag=0;
            break;
        end
        end
    end
    if(flag==0)
        break;
    end
end
%%%%%%%%%%%cropping image%%%%%%%%%%%
cropped_image = grayim(uppos+1:downpos-1,1:size(grayim,2),:);
imshow(cropped_image);
 path='D:/images/equations/characters/';
    %iname=int2str(row);
    cmap=colormap('gray');
    nameim=strcat(nameim,'.jpeg');
    iname=strcat(path,nameim);
    imwrite(cropped_image,cmap,iname,'jpeg');
end