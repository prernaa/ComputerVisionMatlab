% part (f) 

im = imread('primate-caged.jpg');
im = uint8(rgb2gray(im));
figure('name','Original image with dominant diagonal lines');
imshow(im) % displaying the original image

F = fft2(im); % F now contains the fourier tranform of the image im
S = abs(F).^2; % The power spectrum is just the square of the modulus of the Fourier Transform

figure('name','Power Spectrum with FFTSHIFT');
imagesc(fftshift(S.^0.1)); % fftshift is needed to put the dc component (frequency=0) in the centre
colormap('default');

figure('name','Power Spectrum without FFTSHIFT');
imagesc(S.^0.1);
colormap('default');
[x,y]=ginput; % ginput to take coordinates from mouse cursor
x
y
% (x(1), y(1)) and (x(2), y(2)) are the 2 corresponding peaks

[r,c] = size(x);
for n = 1:r
    if(y(n)-3 > 0 && x(n)-3 > 0)
        F(y(n)-3:y(n)+3, x(n)-3:x(n)+3)=0;  % setting 5x5 pixels neighbouring the peak at (x(1),y(1)) to 0
    end
end 

S_new = abs(F).^2;
figure('name','New Power Spectrum with FFTSHIFT');
imagesc(fftshift(S_new.^0.1)); % fftshift is needed to put the dc component (frequency=0) in the centre
colormap('default');

im_new = uint8(real(ifft2(F)));
figure('name','Final Image display');
imshow(im_new) % Resulting image displayed
