% Optional Experiment - Line Finding Using Hough Transform

% part (a)

im = imread('macritchie.jpg');
figure('name', 'Original Image');
im = rgb2gray(im); % converting image to grayscale
imshow(im) % displaying the original image in grayscale

tl = 0.04;
th = 0.1;
sigma = 1.0;
E = edge(im, 'canny', [tl th], sigma); % Applying canny edge detection
figure('name', 'Canny Edge Image'); 
% Displaying resulting image after canny edge detection
imshow(E)

% part (b)
[imr,imc] = size(im);
cr = floor( (imr+1)/2 );
cc = floor( (imc+1)/2 );

theta = 0:179;
[H, xp] = radon(E, theta);
figure('name', 'Hough/Radon Transform of the binary image');
imshow(uint8(H))
size(H)

[r,c] = find(H==max(H(:)));
xpmax = xp(r);
thmax = theta(c);
r,c
xpmax
thmax

[A,B] = pol2cart(thmax*pi/180, xpmax);
B=-B;
A,B

% (r,c) = (121, 91) for the maximum intensity pixel when the origin is at
% the center of the image