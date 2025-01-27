% DIP basics
clc;
clear all;
close all;

%Reading the image
I = imread("cat_sample_img.jpg");

% taking matrix of each red,blue and green
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

% Taking average of 3 for gray scale 
Ig=((R+G+B)/3);

% To calulate threshold
count = sum(Ig(:));
threshold=count/(180*240);

% Giving value 1 for above and 0 for below value of threshold
Ib = Ig > threshold;

% Taking only last matrix and changing other 1,2 all values zeroes
Iblue=I;
Iblue(:,:,1)=0;
Iblue(:,:,2)=0;


%similar for Red
Ired=I;
Ired(:,:,2)=0;
Ired(:,:,3)=0;

%similar for green
Igreen=I;
Igreen(:,:,1)=0;
Igreen(:,:,3)=0;


% ploting all the images
subplot(2,3,1);
imshow(I);
title("Original Image");

subplot(2,3,2);
imshow(Ig);
title("Grayscale Image");

subplot(2,3,3);
imshow(Ib);
title("B&W Image");

subplot(2,3,4);
imshow(Ired);
title("Red Image");

subplot(2,3,5);
imshow(Igreen);
title("Green Image");

subplot(2,3,6);
imshow(Iblue);
title("Blue Image");