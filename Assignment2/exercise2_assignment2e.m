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

s = load('signal.txt');
k1 = gauss(2);
k2 = [.1 .6 .4];

figure('name', '2e');
subplot(2, 2, 1);
plot(s);
title('s');

subplot(2, 2, 2);
plot(conv(conv(s, k1), k2));
title('(s * k1) * k2');

subplot(2, 2, 3);
plot(conv(conv(s, k2), k1));
title('(s * k2) * k1');

subplot(2, 2, 4);
plot(conv(s, conv(k1, k2)));
title('s * (k1 * k2)');