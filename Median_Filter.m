clc;
close all;

input_image = imread ("images/owl_salt&pepper.jpeg");
input_image = imresize(im2gray(input_image), 1.5);

n = input("Enter kernel size ");       

padsize = floor(n/2);
input_image = padarray(input_image, [padsize padsize], 'replicate');
[M, N] = size(input_image);


output_image = input_image;
for i = 1:M-n+1
    for j = 1:N-n+1
        arr = input_image(i:i+n-1, j:j+n-1);
        sorted_arr = sort(arr(:));
        output_image(i+padsize,j+padsize) = sorted_arr(round(n^2 /2));
    end
end
figure;
subplot (2,2,1);
imshow(input_image); title('Input Image');

subplot (2,2,3);
plot(imhist(input_image)); ylabel('Frequency'); xlabel('Intensity'); title('Input Image Histogram');

subplot (2,2,2);
imshow(output_image); title('Filtered (Output) Image')

subplot (2,2,4);
plot(imhist(output_image)); ylabel('Frequency'); xlabel('Intensity'); title('Filtered (Output) Image Histogram');


sgtitle('Median Filter');

