#! /usr/local/bin/octave -qf

arg_list = argv ();

input = arg_list{1};
output = arg_list{2};

input_img = imread(input);

new_dims = size(input_img) - rem(size(input_img), 4);
cropped_img = input_img(1:new_dims(1),1:new_dims(2), :);

disp(size(input_img))
disp(size(cropped_img))

block_dims = new_dims./[4 4 1];
block_dims = block_dims + [0 0 3]

blocks = mat2cell(cropped_img, block_dims(1) * ones(4,1), block_dims(2) * ones(4,1), block_dims(3));

blocks(1:16) = blocks(randperm(16));
blocks(ceil(16 * rand(1))) = {zeros(block_dims, class(cropped_img))};

R = cell2mat(blocks);
imwrite(R, output);