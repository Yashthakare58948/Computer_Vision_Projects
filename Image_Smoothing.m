clc;
clear;
close all;
img = imread('image.jpg'); 
if size(img,3) == 3
    img = rgb2gray(img);
end
img = im2double(img);
avg_kernel = ones(3,3) / 9;
smooth_avg = conv2(img, avg_kernel, 'same');
gaussian_kernel = fspecial('gaussian', [9 9], 1);
smooth_gaussian = conv2(img, gaussian_kernel, 'same');
smooth_builtin = imfilter(img, gaussian_kernel, 'replicate');
figure('Name','Smoothing Comparison','NumberTitle','off','Position',[100 100 1000 600]);
subplot(2,2,1);
imshow(img,[]);
title('Original Image');
subplot(2,2,2);
imshow(smooth_avg,[]);
title('Smoothed - Averaging Filter (3x3)');
subplot(2,2,3);
imshow(smooth_gaussian,[]);
title('Smoothed - Gaussian Filter (conv2)');
subplot(2,2,4);
imshow(smooth_builtin,[]);
title('Smoothed - Gaussian Filter (imfilter)');
sgtitle('Image Smoothing Comparison');