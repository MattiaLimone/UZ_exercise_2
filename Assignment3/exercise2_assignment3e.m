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

img1 = imread('cat1.jpg');
img2 = imread('cat2.jpg');

R1 = img1(:,:,1);
R2 = img2(:,:,1);
G1 = img1(:,:,2);
G2 = img2(:,:,2);
B1 = img1(:,:,3);
B2 = img2(:,:,3);
%% Version 1
sigma = 3;
imgR1Gauss = imgaussfilt(R1,sigma);
imgR2Laplace = laplacefilter(R2, sigma);
imgG1Gauss = imgaussfilt(G1,sigma);
imgG2Laplace = laplacefilter(G2, sigma);
imgB1Gauss = imgaussfilt(B1,sigma);
imgB2Laplace = laplacefilter(B2, sigma);


img1Gauss = cat(3, imgR1Gauss,imgG1Gauss,imgB1Gauss);
img2Laplace = cat(3, imgR2Laplace,imgG2Laplace,imgB2Laplace);
imgFinal = img1Gauss + 5*uint8(img2Laplace);

figure('name', '3e - optional');
subplot(2, 3, 1);
imagesc(img1);
title 'cat1';

subplot(2, 3, 4);
imagesc(img2);
title 'cat2';

subplot(2, 3, 2);
imagesc(uint8(img1Gauss));
title 'Gaussian filtered';

subplot(2, 3, 5);
imagesc(img2Laplace); colormap gray;
title 'Laplacian filtered';

subplot(2, 3, 3);
imagesc(imgFinal); colormap gray;
title 'Combination';

%% Version 2

sigma = 4;
imgR1Gauss = imgaussfilt(R1,sigma);
imgR2Laplace = laplacefilter2(R2, sigma);
imgG1Gauss = imgaussfilt(G1,sigma);
imgG2Laplace = laplacefilter2(G2, sigma);
imgB1Gauss = imgaussfilt(B1,sigma);
imgB2Laplace = laplacefilter2(B2, sigma);


img1Gauss = cat(3, imgR1Gauss,imgG1Gauss,imgB1Gauss);
img2Laplace = cat(3, imgR2Laplace,imgG2Laplace,imgB2Laplace);
imgFinal = img1Gauss + 5* uint8(img2Laplace);

figure('name', '3e - optional');
subplot(2, 3, 1);
imagesc(img1);
title 'cat1';

subplot(2, 3, 4);
imagesc(img2);
title 'cat2';

subplot(2, 3, 2);
imagesc(uint8(img1Gauss));
title 'Gaussian filtered';

subplot(2, 3, 5);
imagesc(img2Laplace); colormap gray;
title 'Laplacian filtered';

subplot(2, 3, 3);
imagesc(imgFinal); colormap gray;
title 'Combination';