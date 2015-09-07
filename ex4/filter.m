#! /usr/local/bin/octave -qf

addpath('./');
arg_list = argv ();

input = arg_list{1};
output = arg_list{2};

input_img = imread(input);
gray_input_img = rgb2ind(input_img);

imwrite(gray_input_img, "gray.pgm");

R = conv2(gray_input_img, ones(3) / 1);
imwrite(R, output);
