clc;
close all;
clear all;

input_image = imread("images/vintage_car.jpeg");

input_image = im2gray(input_image);
image_hist = imhist(input_image);
N = numel(input_image);

% PDF
pdf_hist = image_hist ./ N;

% CDF
cdf_hist = cumsum(pdf_hist);

output_image = uint8(round(cdf_hist(input_image + 1) * numel(image_hist)));

subplot(2,3,1);
imshow(input_image); title('Input Image');

subplot(2,3,4);
plot(imhist(input_image)); title('Input Image Histogram');
ylabel('Frequency'); xlabel('Intensity')

subplot(2,3,3);
imshow(output_image); title('Histogram Equilized (Output) Image');

subplot(2,3,2);
plot(pdf_hist); title('PDF (Normalized Input Histogram)');

subplot(2,3,5);
plot(cdf_hist); title('CDF');

subplot(2,3,6);
plot(imhist(output_image)); title('Output Image Histogram');
ylabel('Frequency'); xlabel('Intensity')



% plot (cdf_hist_output);
