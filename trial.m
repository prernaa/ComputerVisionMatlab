% Experiment 3 - LINEAR FILTERING

% part (a)

[x,y] = meshgrid(-2:2, -2:2); % creates a cartesian grid in space
[x1,y1] = meshgrid(-15:15, -15:15);
sigma1 = 1.0; % initialising sigma value for first filter
sigma2 = 2.0; % initialising sigma value for second filter

filter1 = (1/(2*pi*sigma2^2)) * exp(-((x1.^2+y1.^2)/(2*sigma2^2))); % formula for first gaussian filter
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