#! /usr/local/bin/octave -q -f

warning ("off", "Octave:broadcast");
arg_list = argv ();

# Get arguments from arg list
input_a = arg_list{1};
input_b = arg_list{2};
output = arg_list{3};

# Read images from input files
[input_img_a, input_map_a, input_alpha_a] = imread (input_a);
[input_img_b, input_map_b, input_alpha_b] = imread (input_b);

# Define the bins
bins = [4,32,128,256];

# Get RGB from image A
img_a_r = input_img_a(:,:,1);
img_a_g = input_img_a(:,:,2);
img_a_b = input_img_a(:,:,3);

# Get RGB from image B
img_b_r = input_img_b(:,:,1);
img_b_g = input_img_b(:,:,2);
img_b_b = input_img_b(:,:,3);

for bin = 1:4

  # Get histogram from image A
  hist_a_r = hist(img_a_r, bins(bin));
  hist_a_g = hist(img_a_g, bins(bin));
  hist_a_b = hist(img_a_b, bins(bin));

  # Get histogram from image B
  hist_b_r = hist(img_a_r, bins(bin));
  hist_b_g = hist(img_a_g, bins(bin));
  hist_b_b = hist(img_a_b, bins(bin));

  # Normalize the histogram for the Image A
  hist_a_r = hist_a_r / sum (hist_a_r);
  hist_a_g = hist_a_g / sum (hist_a_g);
  hist_a_b = hist_a_b / sum (hist_a_b);

  # Calculate the euclidian distance for the images

  # Normalize the histogram for the Image B
  hist_a_r = hist_a_r / sum (hist_a_r);
  hist_a_g = hist_a_g / sum (hist_a_g);
  hist_a_b = hist_a_b / sum (hist_a_b);

  # Save histogram images as files from image A
  imwrite(hist_a_r, strcat(output, "baboon_hist_r.png"));
  imwrite(hist_a_g, strcat(output, "baboon_hist_g.png"));
  imwrite(hist_a_b, strcat(output, "baboon_hist_b.png"));

  # Save histogram images as files from image B
  imwrite(hist_b_r, strcat(output, "peppers_hist_r.png"));
  imwrite(hist_b_g, strcat(output, "peppers_hist_g.png"));
  imwrite(hist_b_b, strcat(output, "peppers_hist_b.png"));

  # Calculate the euclidean distance for the RGB channels
  dist_r(bin) = norm(hist_a_r - hist_b_r, 2);
  dist_g(bin) = norm(hist_a_g - hist_b_g, 2);
  dist_b(bin) = norm(hist_a_b - hist_b_b, 2);

  # Calculate the mean euclidean distance for the images
  d(bin) = mean([dist_r(bin), dist_g(bin), dist_b(bin)]);
  disp(mat2str(d(bin)));

endfor