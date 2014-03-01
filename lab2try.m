% Author: Prerna

% Experiment 1 - Suppressing Noise Interference Patterns

% part (a)

im = imread('pck-int.jpg');
figure('name','Original image with dominant diagonal lines');
imshow(im) % displaying original image which was taken as input


% part (b)

F = fft2(im); % F now contains the fourier tranform of the image im
S = abs(F).^2; % The power spectrum is just the square of the modulus of the Fourier Transform

figure('name','Power Spectrum with FFTSHIFT');
imagesc(fftshift(S.^0.1)); % fftshift is needed to put the dc component (frequency=0) in the centre
colormap('default'); % power spectrum is displayed with FFTSHIFT

% part (c)

figure('name','Power Spectrum without FFTSHIFT');
imagesc(S.^0.1);
colormap('default'); % power spectrum is displayed without FFTSHIFT
[x,y]=ginput;
x
y
% (x(1), y(1)) and (x(2), y(2)) are the 2 corresponding peaks

% part (d)

[r,c] = size(x);
for n = 1:r
    if(y(n)-2 > 0 && x(n)-2 > 0)
        F(y(n)-2:y(n)+2, x(n)-2:x(n)+2)=0;  % setting 5x5 pixels neighbouring the peak at (x(n),y(n)) to 0
    end
end 

S_new = abs(F).^2;
figure('name','New Power Spectrum with FFTSHIFT');
imagesc(fftshift(S_new.^0.1)); % fftshift is needed to put the dc component (frequency=0) in the centre
colormap('default'); % New Power Spectrum is displayed (after setting 5x5 pixels near peaks to 0)

% part (e)

im_new = uint8(real(ifft2(F))); % Inverse fourier transform to obtain final image
figure('name','Final Image display'); 
imshow(im_new) % final image is displayed

% attempt to improve things further
for n = 1:r
    if(y(n)-5 > 0 && x(n)-5 > 0)
        F(y(n)-5:y(n)+5, x(n)-5:x(n)+5)=0;  % setting 11x11 pixels neighbouring the peak at (x(n),y(n)) to 0
    end
end  % setting 5x5 pixels neighbouring the peak at (x(2),y(2)) to 0

S_new2 = abs(F).^2;
figure('name','New Power Spectrum with FFTSHIFT (11x11 neighborhood)');
imagesc(fftshift(S_new2.^0.1)); % fftshift is needed to put the dc component (frequency=0) in the centre
colormap('default');  % New Power Spectrum is displayed (after setting 11x11 pixels near peaks to 0)

im_new2 = uint8(real(ifft2(F))); % Inverse fourier transform to obtain final image
figure('name','Final Image display (11x11 neighborhood)');
imshow(im_new2) % final image is displayed
