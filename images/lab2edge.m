% Experiment 3 - Edge Detection

% part (a)

im = imread('macritchie.jpg');
figure('name', 'Original Image');
im = rgb2gray(im); % converting image to grayscale
imshow(im) % displaying the original image in grayscale

% part (b)
hsobel = [-1 -2 -1; 0 0 0; 1 2 1] % Horizontal Sobel Mask
vsobel = hsobel'; % Vertical Sobel Mask
hsobel % displaying Horizontal Sobel Mask
vsobel % displaying Vertical Sobel Mask

hresult = conv2(double(im), hsobel, 'same'); 
% resultant image after convolution using Horizontal Sobel Mask
vresult = conv2(double(im), vsobel, 'same'); 
% resultant image after convolution using Vertical Sobel Mask

figure('name', 'Horizontal Sobel Result');
imshow(hresult) % displaying result of convolution using Horizontal Sobel Mask
figure('name', 'Vertical Sobel Result');
imshow(vresult) % displaying result of convolution using Vertical Sobel Mask


% part (c)

E = sqrt(hresult.^2 + vresult.^2); % creating the combined image

figure('name', 'Combined Sobel Result');
imshow(uint8(E)) % Displaying the result of the combined image


% part (d)
t1 = 200; % threshold value
thresholdImage1 = uint8((E>t1)*255); 
% creating a binary image where every element is either 0 or 255
figure('name', 'Threshold Image with t1=200');
imshow(thresholdImage1) % displaying that binary image

% trying another threhold value
t2 = 128; % threshold value
thresholdImage2 = uint8((E>t2)*255); 
% creating a binary image where every element is either 0 or 255
figure('name', 'Threshold Image with t2=128');
imshow(thresholdImage2) % displaying that binary image


% part (e)
tl = 0.04;
th = 0.1;
sigma = 1.0;
E = edge(im, 'canny', [tl th], sigma); % Applying canny edge detection
figure('name', 'Canny Edge Image'); 
% Displaying resulting image after canny edge detection
imshow(E)

tl = 0.04;
th = 0.1;
sigma = 3.0;
E = edge(im, 'canny', [tl th], sigma); % Applying canny edge detection
figure('name', 'Canny Edge Image 2'); 
% Displaying resulting image after canny edge detection
imshow(E)

tl = 0.0;
th = 0.1;
sigma = 2.0;
E = edge(im, 'canny', [tl th], sigma); % Applying canny edge detection
figure('name', 'Canny Edge Image tl=0.0 sigma=2.0'); 
% Displaying resulting image after canny edge detection
imshow(E)

tl = 0.04;
th = 0.1;
sigma = 2.0;
E = edge(im, 'canny', [tl th], sigma); % Applying canny edge detection
figure('name', 'Canny Edge Image tl=0.04 sigma=2.0'); 
% Displaying resulting image after canny edge detection
imshow(E)

tl = 0.09;
th = 0.1;
sigma = 2.0;
E = edge(im, 'canny', [tl th], sigma); % Applying canny edge detection
figure('name', 'Canny Edge Image tl=0.09 sigma=2.0'); 
% Displaying resulting image after canny edge detection
imshow(E)
