clc;
clear;
close all;
%% 1. Read the image (ADD YOUR IMAGE PATH HERE)
imagePath = 'eagle.jpg';   % Replace with your image file
img = imread(imagePath);
if isempty(img)
    error('Image not found. Check the image path.');
end
% Convert to grayscale if needed
if size(img,3) == 3
    gray = rgb2gray(img);
else
    gray = img;
end
%% 2. Apply HOG Feature Extraction
[cellH, cellW] = deal(8, 8);
[hogFeatures, hogVisualization] = extractHOGFeatures( ...
    gray, ...
    'CellSize', [cellH cellW], ...
    'BlockSize', [2 2], ...
    'NumBins', 9 ...
);
%% 3. Display Results
figure('Position', [100 100 1000 500]);
subplot(1,2,1);
imshow(img);
title('Original Image');
axis off;
subplot(1,2,2);
imshow(gray);
hold on;
plot(hogVisualization);
title('HOG Feature Visualization');
axis off;
%% 4. Print Feature Vector Size
fprintf('HOG feature vector length: %d\n', length(hogFeatures));