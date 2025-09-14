clc;


input_image = imread ("C:\Users\DarkM\OneDrive\Pictures\Camera Roll 1\IMG_20250523_183252671_HDR.jpg");
input_image = imresize(imrotate(im2gray(input_image), -90), 1.5);
input_image = imread ("C:\Users\DarkM\OneDrive\Pictures\salt&pepper_owl.jpeg");
input_image = imresize(im2gray(input_image), 1.5);

n = input("Enter kernel size ");
kernel = ones(n,n) ./ n^2;

output_image = uint8(conv2(double(input_image), kernel, 'same'));

figure;
subplot (2,2,1);
imshow(input_image); title('Input Image');

subplot (2,2,3);
plot(imhist(input_image)); ylabel('Frequency'); xlabel('Intensity'); title('Input Image Histogram');

subplot (2,2,2);
imshow(output_image); title('Filtered (Output) Image')

subplot (2,2,4);
plot(imhist(output_image)); ylabel('Frequency'); xlabel('Intensity'); title('Filtered (Output) Image Histogram');

sgtitle('Moving Average Filter');