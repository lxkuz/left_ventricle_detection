function [contour] = ContourMaker(path)
origImg = imread(path);
BW = im2bw(rgb2gray(origImg));
% show it
figure;
[H,theta,rho] = hough(BW);
imshow(BW,[]);