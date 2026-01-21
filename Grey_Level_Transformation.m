I = imread('input_image.jpg');
if size(I,3) == 3, gray = rgb2gray(I); else, gray = I; end
gray = im2uint8(gray);
neg = 255 - gray;
c = 255 / log(1 + double(max(gray(:))));
logT = uint8(c * log(1 + double(gray)));
gammaVal = 0.5;
powerLaw = uint8(255 * ((double(gray)/255) .^ gammaVal));
% Display all in one figure using tiledlayout
figure('Name','All Grey-Level Transformations','NumberTitle','off');
t = tiledlayout(2,3,'Padding','compact','TileSpacing','compact');
titles = {'Original','Negative','Log','Power-law (\gamma=0.5)'};
images = {gray, neg, logT, powerLaw};
for k = 1:numel(images)
ax = nexttile;
imshow(images{k},[]);
title(titles{k}, 'Interpreter','none');
end
sgtitle('Grey-Level Transformations');