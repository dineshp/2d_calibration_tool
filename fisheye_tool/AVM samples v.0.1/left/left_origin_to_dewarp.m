%% left_origin -> left_dewarp
clc;

I = imread('left_origin.bmp');
U = undistort(calib_data.ocam_model, I, 10, 1);
imwrite(U, 'left_dewarp.png');
