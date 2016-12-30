%% right_origin -> right_dewarp
clc;

I = imread('right_origin.bmp');
U = undistort(calib_data.ocam_model, I, 10, 1);
imwrite(U, 'right_dewarp.png');
