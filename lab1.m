% CSC408-Computer Vision and Image Processing LAB REPORT
% Student: CHIKERSAL PRERNA
% Instructor: Prof. Qian Kemao
% LAB 1

clear all; close all; clc;
Pc=imread('images/mrt-train.jpg');
whos Pc
P=rgb2gray(Pc);
figure(1);
imshow(P);
a=min(P(:));
b=max(P(:));
whos P
P=double(P);
P2 = (P-a).*(255/(b-a));
figure(2);
%imshow(P2);
%P2=255.*(imsubtract(P,double(rmin))./double(rmax-rmin));
imshow(uint8(P2));
min(P2(:))
max(P2(:))