clear all;
close all;
clc;

I = imread("lena512.png");

% Extracting red, green, and blue channels
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

% Convert to grayscale using weighted sum
Ig = 0.299*R + 0.587*G + 0.114*B;

%applying DWT
% Define the Haar wavelet filter
h = [1/sqrt(2), 1/sqrt(2)]; % Low-pass filter
g = [1/sqrt(2), -1/sqrt(2)]; % High-pass filter

% Apply the filters to the rows
rows_ll = conv2(Ig, h, 'same');
rows_hh = conv2(Ig, g, 'same');

% Downsample the rows by taking every second column
rows_ll = rows_ll(:, 1:2:end);
rows_hh = rows_hh(:, 1:2:end);

% Apply the filters to the columns of the row-filtered images
LL = conv2(rows_ll, h', 'same');
LH = conv2(rows_ll, g', 'same');
HL = conv2(rows_hh, h', 'same');
HH = conv2(rows_hh, g', 'same');

% Downsample the columns by taking every second row
LL = LL(1:2:end, :);
LH = LH(1:2:end, :);
HL = HL(1:2:end, :);
HH = HH(1:2:end, :);

% Display the original and DWT images
figure;

subplot(2, 2, 1);
imshow(LL, []);
title('Approximation (LL)');

subplot(2, 2, 2);
imshow(LH, []);
title('Horizontal Detail (LH)');

subplot(2, 2, 3);
imshow(HL, []);
title('Vertical Detail (HL)');

subplot(2,2,4);
imshow(HH, []);
title('Diagonal Detail (HH)');