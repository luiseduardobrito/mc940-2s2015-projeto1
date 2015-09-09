#! /usr/local/bin/octave -qf

arg_list = argv ();

input = arg_list{1};
output = arg_list{2};

input_img = imread(input);
d_input_img = double(input_img);

for i = 1:8

  img_bitplane = bitget(input_img, i);
  filename = strcat(strcat("bitplane_", num2str(i)), ".pgm");
  imwrite(img_bitplane, strcat(output, filename));

  endfor