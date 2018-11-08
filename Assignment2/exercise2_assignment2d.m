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

sigma = 2.1;
g = gauss(sigma);
figure('name', '2d.1');
plot(g, 'b');
hold on;
plot(k, 'r');
legend({'My kernel', 'Given kernel'});

sigmas = [0.5 1:4];
figure('name', '2d.2');
hold on;
for i = sigmas
    plot(round(-3*i):round(3*i), gauss(i));
end
legend({'Sigma = 0.5', 'Sigma = 1', 'Sigma = 2', 'Sigma = 3', 'Sigma = 4'});