% part (b)

imL = imread('corridorl.jpg'); % reading left image
imR = imread('corridorr.jpg'); % reading right image
imL = rgb2gray(imL); % converting left image to grayscale
imR = rgb2gray(imR); % converting right image to grayscale
figure('name', 'Image 1 Left');
imshow(imL)
figure('name', 'Image 1 Right');
imshow(imR)


% part (c)

D = dispmap2(imL, imR, 11, -10, 15);
figure('name', 'Image 1 Result');
imshow(uint8(-D), [-15 15]);


% part (d)

imL2 = imread('triclops-i2l.jpg'); % reading left image
imR2 = imread('triclops-i2r.jpg'); % reading right image
imL2 = rgb2gray(imL2); % converting left image to grayscale
imR2 = rgb2gray(imR2); % converting right image to grayscale
figure('name', 'Image 2 Left');
imshow(imL2)
figure('name', 'Image 2 Right');
imshow(imR2)

D2 = dispmap2(imL2, imR2, 11, -10, 15);
figure('name', 'Image 2 Result');
imshow(uint8(-D2), [-15 15]);