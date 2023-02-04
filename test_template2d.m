
%pkg load image; % AFTER function definition

% Test code:
%tablet = imread('tablet.png');
%% POSSIBLE INDEXING ERROR


tablet = rgb2gray(imread('/home/mup/Pictures/image_processing/CvPhoto.jpg'));
%imshow(tablet);
% x= 414 y = 446
glyph = tablet(420:500, 380:500); % right eye
%imshow(glyph);
%tablet = tablet(200:700,200:700);
match_scores = zeros(10,10);
y = 100; x = 100;
[y, x, match_scores] = template_2d(im2double(glyph), ...    
im2double(tablet));
disp([y x]); % should be the top-left corner of template in tablet

figure(1)
subplot(2,1,1)
imshow(tablet);
rectangle('Position',[y x 120 80], 'Linewidth', 5)
subplot(2,1,2)
imshow(glyph);
%subplot(3,1,3)
figure(2)
%plot(t)
surf(match_scores);
shading flat;
view(2);

