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

umbrellas = imread('umbrellas.jpg');
H = myhist3new(umbrellas, 8);
figure('Name', '1c');
subplot(1, 4, 1);
imshow(umbrellas); 

histTemp = zeros(8, 8);
subplot(1, 4, 2);
temp = sum(H, 1);
histTemp(:) = temp(1, :, :);
bar3(histTemp);

subplot(1, 4, 3);
temp = sum(H, 2);
histTemp(:) = temp(:, 1, :);
bar3(histTemp);

subplot(1, 4, 4);
bar3(sum(H, 3));