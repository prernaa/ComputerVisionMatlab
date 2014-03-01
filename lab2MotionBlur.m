% Experiment 2 - Elimination of Motion Blur

% part (a)

im = imread('sign-blurred.jpg');
figure('name','Original image with simulated horizontal motion blur');
imshow(im) % displaying original image

% part (c)

G = fft2(im); % G now contains the fourier tranform of the image im
S = abs(G).^2; % The power spectrum is just the square of the modulus of the Fourier Transform

figure('name','Power Spectrum with FFTSHIFT');
imagesc(fftshift(S.^0.1)); % fftshift is needed to put the dc component (frequency=0) in the centre
colormap('default'); 

% part (e) 
h = zeros(26);
for n= 1:26
    h(13,n)=1; 
end
h % the final rectangular impulse is created

H = fft2(h,256,256); % H is the fourier transform of the rectangular impulse
SNR = 10; % signal to noise ratio is fixed to 1
Result = (conj(H)*G)/(abs(H).^2 + (1/SNR)); 
% result is calculated based on the Wiener filter formula

FinalImage = uint8(real(ifft2(Result))); % Inverse fourier transform is used to get the final image
figure('name','Final Image');
imshow(Result) % displaying final image