%% 
clc;

%left_origin -> left_dewarp
I = imread('left_origin.bmp');
U = undistort(calib_data.ocam_model, I, 10, 1);
imwrite(U, 'left_dewarp.png');

% rear_origin -> rear_dewarp
I = imread('rear_origin.bmp');
U = undistort(calib_data.ocam_model, I, 10, 1);
imwrite(U, 'rear_dewarp.png');

% right_origin -> right_dewarp
I = imread('right_origin.bmp');
U = undistort(calib_data.ocam_model, I, 10, 1);
imwrite(U, 'right_dewarp.png');

% front_origin -> front_dewarp
I = imread('froont_origin.bmp');
U = undistort(calib_data.ocam_model, I, 10, 1);
imwrite(U, 'front_dewarp.png');






