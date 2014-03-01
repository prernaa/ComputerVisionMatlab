% Author: Prerna

% Experiment 1 - Contrast Stretching

% part (a)

Pc=imread('images/mrt-train.jpg'); % Pc now contains the image
whos Pc;
P = rgb2gray(Pc); % P stores a gray scale image of Pc


% part (b)

figure(1);
imshow(P) % display the image P


% part (c)

rmin = min(P(:)); % least pixel intensity value of P
rmax = max(P(:)); % largest pixel intensity value of P
rmin % display rmin
rmax % display rmax


% part (d)
% we need to use contrast stretching to scale the gray levels from [rmin,rmax]
% to [0,255]

P=double(P); % converting P from uint8 to double
P2 = 255.*((P-double(rmin))./double(rmax-rmin)); % CONTRAST STRETCHING CODE
smin = min(P2(:)); % least pixel intensity value of P2
smax = max(P2(:)); % largest pixel intensity value of P
smin % display smin
smax % display smax


% part (e)
figure(2);
imshow(uint8(P2)) % displaying the processed image P2 after contrast stretching



% Experiment 2 - Histogram Equalization

% part (a)

P = uint8(P); % converting P from double to uint8

figure('name','Original Histogram with 10 bins');
imhist(P,10); % displaying original histogram with 10 bins

figure('name','Original Histogram with 256 bins');
imhist(P,256); % displaying original histogram with 256 bins


% part (b)

P3 = histeq (P, 255); % Equalizing histogram

figure('name','Equalized Histogram with 10 bins');
imhist(P3, 10); % displaying equalized histogram with 10 bins

figure('name','Equalized Histogram with 256 bins');
imhist(P3,256); % displaying equalized histogram with 256 bins

% part (c)

P4 = histeq (P3, 255); % Equalizing histogram once again

figure('name','Re-equalized Histogram with 10 bins');
imhist(P4,10); % displaying re-equalized histogram with 10 bins

figure('name','Re-equalized Histogram with 256 bins');
imhist(P4, 256); % displaying re-equalized histogram with 256 bins



% Experiment 3 - LINEAR FILTERING

% part (a)

[x,y] = meshgrid(-2:2, -2:2); % creates a cartesian grid in space
sigma1 = 1.0; % initialising sigma value for first filter
sigma2 = 2.0; % initialising sigma value for second filter

filter1 = (1/(2*pi*sigma1^2)) * exp(-((x.^2+y.^2)/(2*sigma1^2))); % formula for first gaussian filter
filter1 = filter1./sum(filter1(:)); % normalising first gaussian filter

filter2 = (1/(2*pi*sigma2^2)) * exp(-((x.^2+y.^2)/(2*sigma2^2))); % formula for second gaussian filter
filter2 = filter2./sum(filter2(:)); % normalising second gaussian filter

% displaying the filters as meshes:
figure('name', 'First Filter with sigma 1');
mesh(filter1);
figure('name', 'Second Filter with sigma 2');
mesh(filter2);


% part (b)

im = imread('images/ntu-gn.jpg'); % reading image with additive gaussian noise
figure('name', 'Original Image with Additive Gaussian Noise');
imshow(im)


% part (c)
im_filter1 = conv2(im, filter1); % convulation using first filter
im_filter2 = conv2(im, filter2); % convulation using second filter
im_filter1 = uint8(im_filter1); % converting from double to uint8
im_filter2 = uint8(im_filter2); % converting from double to uint8
figure('name', 'Additive Gaussian Noise - Filter1');
imshow(im_filter1)
figure('name', 'Additive Gaussian Noise - Filter2');
imshow(im_filter2)

% part (d)

im2 = imread('images/ntu-sp.jpg'); % reading image with additive speckle noise
figure('name', 'Original Image with Additive Speckle Noise');
imshow(im2)

% part (e)
im2_filter1 = conv2(im2, filter1, 'same'); % convulation using first filter
im2_filter2 = conv2(im2, filter2, 'same'); % convulation using second filter
im2_filter1 = uint8(im2_filter1); % converting from double to uint8
im2_filter2 = uint8(im2_filter2); % converting from double to uint8
figure('name', 'Additive Speckle Noise - Filter1');
imshow(im2_filter1)
figure('name', 'Additive Speckle Noise - Filter2');
imshow(im2_filter2)


% Experiment 3 - MEDIAN FILTERING

% Reusing im as the first original image (Additive Gaussian Noise)
im_median3x3 = medfilt2(im, [3 3]); % applying 3x3 median filter to first image
im_median5x5 = medfilt2(im, [5 5]); % applying 5x5 median filter to first image
figure('name', 'Additive Gaussian Noise - 3x3 Median Filter');
imshow(im_median3x3)
figure('name', 'Additive Gaussian Noise - 5x5 Median Filter');
imshow(im_median5x5)

% Reusing im2 as the second original image (Additive Speckle Noise)
im2_median3x3 = medfilt2(im2, [3 3]); % applying 3x3 median filter to second image
im2_median5x5 = medfilt2(im2, [5 5]); % applying 5x5 median filter to second image
figure('name', 'Additive Speckle Noise - 3x3 Median Filter');
imshow(im2_median3x3)
figure('name', 'Additive Speckle Noise - 5x5 Median Filter');
imshow(im2_median5x5)