#! /usr/local/bin/octave -qf

# Add path and get arguments
addpath("./")
arg_list = argv ();

# Get arguments from arg list
input_a = arg_list{1};
input_b = arg_list{2};
output = arg_list{3};

# Read images from input files
[input_img_a, input_map_a, input_alpha_a] = imread (input_a);
[input_img_b, input_map_b, input_alpha_b] = imread (input_b);

# Get RGB from image A
img_a_r = input_img_a(:,:,1);
img_a_g = input_img_a(:,:,2);
img_a_b = input_img_a(:,:,3);

# Quantize RGB from image A
img_a_qr = imquantize(img_a_r, 32, "igs");
img_a_qg = imquantize(img_a_g, 32, "igs");
img_a_qb = imquantize(img_a_b, 32, "igs");

# Get histogram from quantized RGB from image A
hist_a_r = hist(img_a_qr);
hist_a_g = hist(img_a_qg);
hist_a_b = hist(img_a_qb);

# Save histogram images as files from image A
imwrite(hist_a_r, strcat(output, "peppers_hist_r.png"));
imwrite(hist_a_g, strcat(output, "peppers_hist_g.png"));
imwrite(hist_a_b, strcat(output, "peppers_hist_b.png"));



# Get RGB from image B
img_b_r = input_img_b(:,:,1);
img_b_g = input_img_b(:,:,2);
img_b_b = input_img_b(:,:,3);

# Quantize RGB from image B
img_b_qr = imquantize(img_b_r, 32, "igs");
img_b_qg = imquantize(img_b_g, 32, "igs");
img_b_qb = imquantize(img_b_b, 32, "igs");

# Get histogram from quantized RGB from image B
hist_b_r = hist(img_b_qr);
hist_b_g = hist(img_b_qg);
hist_b_b = hist(img_b_qb);

# Save histogram images as files from image B
imwrite(hist_b_r, strcat(output, "baboon_hist_r.png"));
imwrite(hist_b_g, strcat(output, "baboon_hist_g.png"));
imwrite(hist_b_b, strcat(output, "baboon_hist_b.png"));