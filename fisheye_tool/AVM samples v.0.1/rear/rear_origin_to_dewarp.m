%% rear_origin -> rear_dewarp
clc;

I = imread('rear_origin.bmp');
U = undistort(calib_data.ocam_model, I, 10, 1);
imwrite(U, 'rear_dewarp.png');
