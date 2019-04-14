clear;
clc;
%  gray level 
L = 256;
% Input image and grayscale
input_img = imread('6.jpg');
input_img = rgb2gray(input_img);
[dim1, dim2, ~] = size(input_img);
n = dim1*dim2;
%Histogram equalization
output_img = Histogram_equalization(input_img,L);

freq_input = zeros(L, 1);
for i = 1:dim1
    for j = 1:dim2
        value = input_img(i, j);
        freq_input(value + 1) = freq_input(value + 1) + 1;
    end
end
freq_input = freq_input./n;

freq_output = zeros(L, 1);
for i = 1:dim1
    for j = 1:dim2
        value = output_img(i, j);
        freq_output(value + 1) = freq_output(value + 1) + 1;
    end
end
freq_output = freq_output./n;
% Output results
figure("color","white");
subplot(2,2,1);
imshow(input_img);
title("Original image");
subplot(2,2,2);
imshow(output_img);
title("Output image");
subplot(2,2,3);
stem(0:L-1,freq_input,'.');
title("Histogram of the original");
xlabel("grayscale");
ylabel("frequentness");
subplot(2,2,4);
stem(0:L-1,freq_output,'.');
title("Histogram of the output");
xlabel("grayscale");
ylabel("frequentness");