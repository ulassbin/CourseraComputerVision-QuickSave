
%pkg load image;
img = im2double(imread('/home/mup/Pictures/image_processing/output_image00.png'));
%img = double(rgb2gray(imread('/home/mup/Pictures/image_processing/CvPhoto.jpg')))/255.0;
%img = rgb2gray(imread('/home/mup/Pictures/image_processing/emre.png'))/255.0;
%img = rgb2gray(imread('/home/mup/Pictures/image_processing/baboon.jpeg'));
%% Load and convert image to double type, range [0, 1] for convenience
%img = double(imread('octagon.png')) / 255.; 
imshow(img); % assumes [0, 1] range for double images

%% Compute x, y gradients
[gx, gy] = imgradientxy(img, 'sobel'); % Note: gx, gy are not normalized

%% Obtain gradient magnitude and direction
[gmag, gdir] = imgradient(gx, gy);
imshow(gmag / (4 * sqrt(2))); % mag = sqrt(gx^2 + gy^2), so [0, (4 * sqrt(2))]
imshow((gdir + 180.0) / 360.0); % angle in degrees [-180, 180]

%% Find pixels with desired gradient direction
my_grad = select_gdir(gmag, gdir, 0.5, -46, -44); % 45 +/- 15
subplot(2,2,1)
title("Base image")
imshow(img)
subplot(2,2,3)
title("Image mag")
imshow(gmag);  % NOTE: enable after you've implemented select_gdir
subplot(2,2,4)
title("Image dir")
imshow(gdir, []);
subplot(2,2,2)
title("MyGrad")
imshow(my_grad, []);