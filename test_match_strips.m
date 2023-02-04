% TODO: Match two strips to compute disparity values



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

%% Define strip row (y) and square block size (b)
y = 120;
b = 100;

%% Extract strip from left image
strip_left = left_gray(y:(y + b - 1), :);
%imshow(strip_left);

%% Extract strip from right image
strip_right = right_gray(y:(y + b - 1), :);
disp("Image size is")
disp(size(right_gray))


figure(2)
subplot(2,1,1)
imshow(strip_left);
subplot(2,1,2)
imshow(strip_right);
title('Strips');

%% Now match these two strips to compute disparity values
disparity = match_strips(strip_left, strip_right, b);
disp(disparity);
figure(3)
plot(disparity);
