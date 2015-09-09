#! /usr/local/bin/octave -qf

warning ("off", "Octave:broadcast");
arg_list = argv ();

input = arg_list{1};
output = arg_list{2};

[input_img, input_map, input_alpha] = imread (input);
[gray_input_img, gray_input_map] = rgb2ind (input_img);

x = ind2gray (gray_input_img, gray_input_map);

imwrite(x, "gray.pgm");

R = conv2(x, ones(3) / 9);
imwrite(R, output);