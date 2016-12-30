%% front_origin -> front_dewarp
clc;

I = imread('front_origin.bmp');
U = undistort(calib_data.ocam_model, I, 10, 1);
imwrite(U, 'front_dewarp.png');
