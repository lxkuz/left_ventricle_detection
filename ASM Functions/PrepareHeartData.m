function [result_data] = PrepareHeartData(imagePath, contourPath, name)
steps_count = 20;
result_data = struct;
im = imread(imagePath);
result_data.('I') = double(rgb2gray(im))./255;
contour = im2bw(imread(contourPath));
[coords_contour(:,1), coords_contour(:,2)] = find(contour == 1);
sort_coord_contour = sort_contour_coordinates(coords_contour, steps_count);
coords_size = length(sort_coord_contour);
default_strange_array_point_value = 2;
t_strange_array = [];
for it = 1:coords_size
    t_strange_array(it, 1) = default_strange_array_point_value;
end;
t_strange_array(1,1) = 0;
t_strange_array(end,1) = 0;
clear white_coords_x white_coords_y;
result_data.('n') = coords_size;
result_data.('x') = sort_coord_contour(:,2)';
result_data.('y') = sort_coord_contour(:,1)';
result_data.('t') = t_strange_array;
p = result_data;
save(['HeartFotos/' name '.mat'], 'p');