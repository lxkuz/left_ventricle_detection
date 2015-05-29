function [ sort_coordinate_contour ] = sort_contour_coordinates( coordinates_contour, step_coordinates )
%UNTITLED Summary of this function goes here
%Input
%   [ coordinates_contour ] - координаты контура;
%   [ step_coordinates ] - шаг прореживания.
%Output
%   [ sort_coordinate_contour ] - отсортированный массив

% r1 = size(im,1) - r;
% p(:,1) = r1;
% p(:,2) = c;
% clear r1;
% clear r;
% clear c;
mass_center(1,2) = mean(coordinates_contour(:,2));
mass_center(1,1) = mean(coordinates_contour(:,1));
p(:,2) = coordinates_contour(:,2) - mass_center(1,2);
p(:,1) = coordinates_contour(:,1) - mass_center(1,1);
[p(:,1),p(:,2)] = cart2pol(p(:,1),p(:,2));
p = sortrows(p);
sort_coordinate_contour = [];
j = 1;
for i = 1:step_coordinates:length(p)
    sort_coordinate_contour(j,:) = p(i,:);
    j = j + 1;
end;
[sort_coordinate_contour(:,2),sort_coordinate_contour(:,1)] = ...
    pol2cart(sort_coordinate_contour(:,1),sort_coordinate_contour(:,2));
sort_coordinate_contour(:,1) = sort_coordinate_contour(:,1) + mass_center(1,2);
sort_coordinate_contour(:,2) = sort_coordinate_contour(:,2) + mass_center(1,1);
end

