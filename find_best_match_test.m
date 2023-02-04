%pkg load image;

% Test code:

%% Load images
left = imread('/home/mup/Pictures/image_processing/flowers-left.png');
right = imread('/home/mup/Pictures/image_processing/flowers-right.png');
figure(1)
subplot(1,2,1)
imshow(left);
subplot(1,2,2)
imshow(right);
%% Convert to grayscale, double, [0, 1] range for easier computation
left_gray = double(rgb2gray(left)) / 255.0;
right_gray = double(rgb2gray(right)) / 255.0;

%% Define image patch location (topleft [row col]) and size
patch_loc = [240 100];
patch_size = [100 100];

%% Extract patch (from left image)
figure(2)
patch_left = left_gray(patch_loc(1):(patch_loc(1) + patch_size(1) - 1), patch_loc(2):(patch_loc(2) + patch_size(2) - 1));
imshow(patch_left);
title("Patch left: Used as template");

%% Extract strip (from right image)
figure(3)
strip_right = right_gray(patch_loc(1):(patch_loc(1) + patch_size(1) - 1), :);
imshow(strip_right);
title("Strip right");

%% Now look for the patch in the strip and report the best position (column index of topleft corner)
figure(4)
best_x = find_best_match(patch_left, strip_right);
disp(best_x);
patch_right = right_gray(patch_loc(1):(patch_loc(1) + patch_size(1) - 1), best_x:(best_x + patch_size(2) - 1));
imshow(patch_right);
title("Patch located at right image.")