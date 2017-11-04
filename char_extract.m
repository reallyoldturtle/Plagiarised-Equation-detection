function char_extract(im2,num)
%filepath='D:\images\equations\1.jpeg';
grayImage = im2;
imshow(im2);
disp(num);
% Get the dimensions of the image.  
% numberOfColorBands should be = 1 i.e not coloured
grayImage=imrotate(grayImage,-90);
[rows, columns, numberOfColorBands] = size(grayImage);
if numberOfColorBands > 1
	% If it's colour then Converting it to gray scale by taking only the green channel
	grayImage = grayImage(:, :, 2); % Take green channel.
end
[pixelCount, grayLevels] = imhist(grayImage);
% Binarize the image.
binaryImage = (grayImage<210);
% Finding the lines and plot them.
verticalProfile = any(binaryImage, 2);
% Finding out where each line starts
rowStarts = find(diff(verticalProfile)>0)+1
rowEnds = find(diff(verticalProfile)<0)
for row = 1 : length(rowStarts)
    try
	thisRow1 = rowStarts(row);
	thisRow2 = rowEnds(row);
	croppedImage = grayImage(thisRow1:thisRow2, :);
	imshow(croppedImage);
    rotateim=imrotate(croppedImage,90);
    filepath='D:/images/equations/characters/';
    iname2=int2str(row);
    iname3=int2str(num);
    iname=strcat(iname3,'x',iname2);
    %cmap=colormap('gray');
    %iname=strcat(filepath,iname,'.jpeg');
    %imwrite(rotateim,cmap,iname,'jpeg');
    no_white(rotateim,iname)
	   catch
        continue;
    end
    
end
end