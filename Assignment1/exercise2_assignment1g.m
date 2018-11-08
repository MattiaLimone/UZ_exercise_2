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

method = 'chi2';
nBins = 8;

[database, files] = load_histogram_database('images', nBins);
distances = zeros(length(files), 1);
refImage = 20;
for i = 1:length(files)
    distances(i) = compare_histograms(database(refImage, :), database(i, :), method);
end
[distancesSorted, sortedIndexes] = sort(distances);

range = 1:5;

figure('Name', '1g');
subplot(1, 2, 1);
plot(distances);
hold on; grid on;
title('Unsorted distances');
xlabel('File index');
ylabel('Distance from ref. image');
xlim([0, length(files)]);
plot(sortedIndexes(range), distancesSorted(range), 'ro');

subplot(1, 2, 2);
plot(distancesSorted);
hold on; grid on;
title('Sorted distances');
xlabel('Image proximity');
ylabel('Distance from ref. image');
xlim([0, length(files)]);
plot(range, distancesSorted(range), 'ro');