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

img = rgb2gray(imread('lena.png'));
imgGauss = imnoise(img,'gaussian', 0, 0.01); % Gaussian noise
imgSalt = imnoise(img,'salt & pepper', 0.1); % Salt & pepper noise

imgGaussFilteredGauss = gaussfilter(double(imgGauss), 1);
imgSaltFilteredGauss = gaussfilter(double(imgSalt), 1);
imgGaussFilteredMedian = median_2d(imgGauss, 3);
imgSaltFilteredMedian = median_2d(imgSalt, 3);
figure('name', '3d - optional');
subplot(2, 3, 1);
imagesc(imgGauss); colormap gray;
title 'Gaussian noise';

subplot(2, 3, 2);
imagesc(imgGaussFilteredGauss); colormap gray;
title 'Gaussian filtered';

subplot(2, 3, 3)
imagesc(imgGaussFilteredMedian); colormap gray;
title 'Median filtered';

subplot(2, 3, 4);
imagesc(imgSalt); colormap gray;
title 'S&P noise';

subplot(2, 3, 5);
imagesc(imgSaltFilteredGauss); colormap gray;
title 'Gaussian filtered';

subplot(2, 3, 6)
imagesc(imgSaltFilteredMedian); colormap gray;
title 'Median filtered';