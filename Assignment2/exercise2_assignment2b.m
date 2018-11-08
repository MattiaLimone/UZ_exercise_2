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

%If the kernel sum is one, then a constant signal turns into a 
%constant signal of the same amplitude. Constant signal are low frequency, 
%so by continuity, you expect a low-pass behavior. If the coeficients sum to zero,
%then a constant signal turns to zero, so you can image a low-cut behavior.

f = load('signal.txt');
k = load('kernel.txt');
res = simple_convolution(f, k);
figure('name', '2b');
plot(f, 'b');
hold on;
plot(k, 'g');
plot(res, 'r');
legend({'Original', 'Kernel', 'Convolution'});