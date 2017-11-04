clc;    % Clearing the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Closing all imtool figures 
clear;  % Erasing all existing variables

%--------------------------------------------------
[baseFileName,folder]=uigetfile('*.jpg');
% Getting the full filename
fullFileName1 = fullfile(folder, baseFileName);
disp(fullFileName1);
eqlines_final(fullFileName1);
pic2ocra();
fid = fopen('D:\a.txt', 'at');
fprintf(fid,'\n');
fclose(fid);
%----------------------2nd file
[baseFileName,folder]=uigetfile('*.jpg');
% Getting the full filename
fullFileName2 = fullfile(folder, baseFileName);
eqlines_final(fullFileName2);
pic2ocrb();
fid = fopen('D:\b.txt', 'at');
fprintf(fid,'\n');
fclose(fid);
winopen('C:\tc\bin\equa.exe');
