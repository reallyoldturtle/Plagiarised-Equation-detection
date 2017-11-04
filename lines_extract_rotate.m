function lines_extract()
clc;    % Clearing the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Closing all imtool figures 
clear;  % Erasing all existing variables
workspace;  
format long g;
format compact;
fontSize = 20;
% Checking that user has the Image Processing Toolbox installed....
hasIPT = license('test', 'image_toolbox');
if ~hasIPT
	% User does not have the toolbox installed.
	message = sprintf('Toolbox not installed, continue anyway?');
	reply = questdlg(message, 'Toolbox missing', 'Yes', 'No', 'Yes');
	if strcmpi(reply, 'No')
		% User said No, so exit.
		return;
	end
end
%reading file
[baseFileName,folder]=uigetfile('*.*','Select the line image file');
% Getting the full filename
fullFileName = fullfile(folder, baseFileName);
% Checking if file exists.
if ~exist(fullFileName, 'file')
	% File doesn't exist here
	fullFileName = baseFileName; % now checking without the path this time.
	if ~exist(fullFileName, 'file')
		% Still didn't find it.  Alert user.
		errorMessage = sprintf('Error: %s does not exist in the search path folders.', fullFileName);
		uiwait(warndlg(errorMessage));
		return;
	end
end
grayImage = imread(fullFileName);
% Get the dimensions of the image.  
% numberOfColorBands should be = 1 i.e not coloured
grayImage=imrotate(grayImage,-90);
[rows, columns, numberOfColorBands] = size(grayImage);
if numberOfColorBands > 1
	% If it's colour then Converting it to gray scale by taking only the green channel
	grayImage = grayImage(:, :, 2); % Take green channel.
end
% Display the original gray scale image.
subplot(2, 3, 1);
imshow(grayImage, []);
axis on;
title('Original Grayscale Image', 'FontSize', fontSize);
% Enlarge figure to full screen.
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
% Give a name to the title bar.
set(gcf,'name','Extracting lines','numbertitle','off') 
% Let's compute and display the histogram.
[pixelCount, grayLevels] = imhist(grayImage);
subplot(2, 3, 2); 
bar(pixelCount);
grid on;
title('Histogram of original image', 'FontSize', fontSize);
xlim([0 grayLevels(end)]); % Scale x axis manually.
% Binarize the image.
binaryImage = (grayImage<210);
subplot(2, 3, 3);
imshow(binaryImage, []);
axis on;
title('Binary Image', 'FontSize', fontSize);
% Finding the lines and plot them.
verticalProfile = any(binaryImage, 2);
subplot(2, 3, 4);
plot(verticalProfile);
grid on;
title('Vertical Profile', 'FontSize', fontSize);
% Finding out where each line starts
rowStarts = find(diff(verticalProfile)>0)+1
rowEnds = find(diff(verticalProfile)<0)
subplot(2, 3, 5:6);
title('This Line', 'FontSize', fontSize);

for row = 1 : length(rowStarts)
    try
	thisRow1 = rowStarts(row);
	thisRow2 = rowEnds(row);
	croppedImage = grayImage(thisRow1:thisRow2, :);
	imshow(croppedImage);
    rotateim=imrotate(croppedImage,90);
    filepath='D:/images/characters/';
    iname=int2str(row);
    cmap=colormap('gray');
    iname=strcat(filepath,iname,'.jpeg');
    imwrite(rotateim,cmap,iname,'jpeg');
	caption = sprintf('Line of text #%d is between lines %d and %d (inclusive)', ...
		row, thisRow1, thisRow2)
	title(caption, 'FontSize', fontSize);
	continue;
    catch
        continue;
    end
    
end
end