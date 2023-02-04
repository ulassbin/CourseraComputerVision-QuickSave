hsize = 100;
sigma = 5;

h = fspecial('gaussian', hsize,sigma);

% Apply a Gaussian filter to remove noise
%img = imread('/home/mup/Pictures/image_processing/saturn.png');
img = rgb2gray(imread('/home/mup/Pictures/image_processing/CvPhoto.jpg'));
%img = rgb2gray(imread('/home/mup/Pictures/image_processing/emre.png'));
%img = rgb2gray(imread('/home/mup/Pictures/image_processing/baboon.jpeg'));

h = fspecial('gaussian',hsize,sigma);
h_correlate = img(420:500, 380:500);
figure(1)
imshow(h_correlate);
figure(2)
c = normxcorr2(h_correlate,img)*100;

[ a, ix ] = max(c(:));
%[ I1, I2] = ind2sub( size(m), ix )


subplot(2,1,1)
%outim = medfilt2(img);
imshow(img);
%subplot(2,1,2)
figure(4)
surf(c);
shading flat;
view(2);
% TODO: Add noise to the image

% TODO: Now apply a Gaussian filter to smooth out the noise
% Note: You may need to pkg load image;
