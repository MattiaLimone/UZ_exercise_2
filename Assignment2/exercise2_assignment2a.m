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

f = [0 1 1 1 0 0.7 0.5 0.2 0 0 1 0];
k = [0.5 1 0.3];
handy = [0 1.3 1.8 1.5 0.71 0.85 0.91 0.45 0.1 0.3 1 0];
convol = simple_convolution(f, k);
handy_res = all(handy == round(convol, 2));
if handy_res == 1 
    disp('They are the same');
elseif handy_res == 0
    disp('They are not the same');
end
%% Comparison
f = load('signal.txt');
k = load('kernel.txt');

myConv = simple_convolution(f, k);
sameConv = conv(f, k, 'same');
fullConv = conv(f, k);
validConv = conv(f, k, 'valid');
figure('Name', '2a');
plot(myConv, 'x');
hold on;
plot(fullConv);
plot(sameConv);
plot(validConv);
legend({'My', 'Full', 'Same', 'Valid'});
