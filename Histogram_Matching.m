clc;
close all;
clear all;

input_image = imread("images/vintage_car.jpg");

input_image = im2gray(input_image);
input_hist = imhist(input_image);
N = numel(input_image);

pdf_hist = input_hist ./ N;  % PDF
cdf_hist = cumsum(pdf_hist);  % CDF

ref_image = imread ("images/tree_in_the_darkness.jpeg");
ref_image = im2gray(ref_image);
ref_hist = imhist(ref_image);
M = numel(ref_image);

pdf_hist_ref = ref_hist ./ M;     % PDF
cdf_hist_ref = cumsum(pdf_hist_ref);  % CDF

% Create mapping from input intensity to reference intensity
mapping = uint8(zeros(256,1));
for intensity = 0 : 255
    [~, index] = min(abs(cdf_hist(intensity + 1) - cdf_hist_ref));
    mapping(intensity + 1) = index - 1;
end

% Apply mapping
%output_image = mapping(uint8((input_image) + 1);
output_image = mapping(uint8(input_image) + 1);

figure;
subplot(2,5,1);
imshow(input_image); title('Input Image');

subplot(2,5,6);
plot(imhist(input_image)); title('Input Image Histogram');

subplot(2,5,3);
imshow(ref_image); title('Reference Image');

subplot(2,5,8);
plot(imhist(ref_image)); title('Reference Image Histogram');

subplot(2,5,5);
imshow(output_image); title('Histogram Equilized (Output) Image');

subplot(2,5,10);
plot(imhist(output_image)); title('Output Image Histogram');

subplot(2,5,2);
plot(pdf_hist); title('Input PDF');

subplot(2,5,7);
plot(cdf_hist); title('Input CDF');

subplot(2,5,4);
plot(pdf_hist_ref); title('Reference PDF');

subplot(2,5,9);
plot(cdf_hist_ref); title('Reference CDF');





