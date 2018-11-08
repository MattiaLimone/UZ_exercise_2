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

f = load('signal.txt');
k = load('kernel.txt');
%Matlab inbuilt function create a smoother graph
res1 = conv(f, k, 'same');
figure('name', '2c');
plot(f, 'b');
hold on;
plot(k, 'g');
plot(res1, 'r'); 
legend({'Original', 'Kernel', 'Convolution'});