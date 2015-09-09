#! /usr/local/bin/octave qf

warning ("off", "Octave:broadcast");
arg_list = argv ();

input_a = arg_list{1};
input_b = arg_list{2};
output = arg_list{3};

img_input_a = imread(input_a);
img_input_b = imread(input_b);

input_a_size = size(img_input_a);
input_b_size = size(img_input_b);

is_same_size = isequal(input_a_size, input_b_size);

if(is_same_size == 0)
    printf("The input images needs to have the same dimensions");
    return;
end

alpha_image_a = 0.5 .* img_input_a;
alpha_image_b = 0.5 .* img_input_b;

R = alpha_image_a + alpha_image_b;
imwrite(R, output);