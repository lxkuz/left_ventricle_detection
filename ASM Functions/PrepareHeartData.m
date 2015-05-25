function [result_data] = PrepareHeartData(imagePath, contourPath, name)
result_data = struct;
im = imread(imagePath);
result_data.('I') = double(rgb2gray(im))./255;
contour = im2bw(imread(contourPath));
[white_coords_x, white_coords_y] = find(contour == 1);
coords_size = length(white_coords_x);
steps_count = 100;
clear_it = 1;
default_strange_array_point_value = 2;
cleaned_white_coords_x = [];
cleaned_white_coords_y = [];
t_strange_array = [];
for it = 1:round(coords_size/steps_count):coords_size
    cleaned_white_coords_x(clear_it,1) = white_coords_x(it,1);
    cleaned_white_coords_y(clear_it,1) = white_coords_y(it,1);
    t_strange_array(clear_it, 1) = default_strange_array_point_value;
    clear_it = clear_it + 1;
end;
t_strange_array(1,1) = 0;
t_strange_array(end,1) = 0;
clear white_coords_x white_coords_y;
result_data.('n') = length(cleaned_white_coords_x);
result_data.('x') = cleaned_white_coords_x;
result_data.('y') = cleaned_white_coords_y;
result_data.('t') = t_strange_array;
p = result_data;
save(['HeartFotos/' name '.mat'], 'p');