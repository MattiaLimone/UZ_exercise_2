% Author: Mattia Limone
% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

img = double(rgb2gray(imread('museum.jpg')));
imgSharp = my_sharpen(img,9);

figure('name', '3b');
subplot(1, 3, 1);
imagesc(img); colormap gray;
title('Original');

subplot(1, 3, 2);
imagesc(imgSharp); colormap gray;
title('Sharpened by me');

subplot(1, 3, 3);
imagesc(imsharpen(img));
title('Sharpened by MatLab')