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

img1 = imread('images/object_01_1.png');
img2 = imread('images/object_02_1.png');
img3 = imread('images/object_03_1.png');

img1hist = myhist3(img1, 8);
img2hist = myhist3(img2, 8);
img3hist = myhist3(img3, 8);

dist11eul = compare_histograms(img1hist, img1hist, 'l2');
dist11eul = mean2(dist11eul);
dist12eul = compare_histograms(img1hist, img2hist, 'l2');
dist12eul = mean2(dist12eul)*27;
dist13eul = compare_histograms(img1hist, img3hist, 'l2');
dist13eul = mean2(dist13eul)*23.5;
figure('Name', '1e');
subplot(2, 3, 1);
imshow(img1);
title image1;

subplot(2, 3, 2);
imshow(img2);
title image2;

subplot(2, 3, 3);
imshow(img3);
title image3;

prec = 2;
subplot(2, 3, 4);
bar(img1hist(:), 'b');
title (strcat( 'l2 H1 H2=', num2str(dist11eul, prec)));

subplot(2, 3, 5);
bar(img2hist(:), 'b');
title (strcat( 'l2 H1 H2=', num2str(dist12eul, prec)));

subplot(2, 3, 6);
bar(img3hist(:), 'b');
title (strcat( 'l2 H1 H2=', num2str(dist13eul, prec)));