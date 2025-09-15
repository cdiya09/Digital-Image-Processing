clc;


input_image = imread ("images/vintage_car.jpg");
input_image = imresize(imrotate(im2gray(input_image), -90), 1.5);

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
