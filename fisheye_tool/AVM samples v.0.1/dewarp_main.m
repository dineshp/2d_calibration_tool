%% run in 2d_calibration_tool\fisheye_tool\AVM samples v.0.1

%origin_to_dewarp
clc;
clear -all;
close all;

load('/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/fisheye_tool/AVM samples v.0.1/Omni_Calib_Results');
%left_origin -> left_dewarp
I = imread('/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/fisheye_tool/AVM samples v.0.1/left_origin.bmp');
U = undistort(calib_data.ocam_model, I, 10, 1);
imwrite(U, '/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/fisheye_tool/AVM samples v.0.1/left_dewarp.png');

% rear_origin -> rear_dewarp
I = imread('/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/fisheye_tool/AVM samples v.0.1/rear_origin.bmp');
U = undistort(calib_data.ocam_model, I, 10, 1);
imwrite(U, '/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/fisheye_tool/AVM samples v.0.1/rear_dewarp.png');

% right_origin -> right_dewarp
I = imread('/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/fisheye_tool/AVM samples v.0.1/right_origin.bmp');
U = undistort(calib_data.ocam_model, I, 10, 1);
imwrite(U, '/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/fisheye_tool/AVM samples v.0.1/right_dewarp.png');

% front_origin -> front_dewarp
I = imread('/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/fisheye_tool/AVM samples v.0.1/front_origin.bmp');
U = undistort(calib_data.ocam_model, I, 10, 1);
imwrite(U, '/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/fisheye_tool/AVM samples v.0.1/front_dewarp.png');






%dewarp_png2yuv
ColorImageRGB = imread('/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/fisheye_tool/AVM samples v.0.1/front_dewarp.png');
ColorImageYUV = rgb2ycbcr(ColorImageRGB);

[rows cols d] = size(ColorImageRGB);
dims = [cols rows];
dimsUV = uint8(dims / 2);
Yd = zeros(dimsUV);
UVd = zeros(dimsUV);

Y = Yd';
U = UVd';
V = UVd';
Y = uint8(Y);
U = uint8(U);
V = uint8(V);

%sample:420
for i = 1 : rows
    for j = 1 : cols
        %sample Y in every row
        r = ColorImageRGB(i,j,1);
        g = ColorImageRGB(i,j,2);
        b = ColorImageRGB(i,j,3);
        Y(i,j) = 0.299 * r + 0.587 * g + 0.114 * b + 16;
        %old line : sample 1/2 U
        if mod(i,2) == 1
            index_i = uint8(i / 2);
            index_j = uint8(j / 2);
            U(index_i,index_j) = -0.147 * r - 0.289 * g + 0.436 * b + 128;
        end
        %even line : sample 1/2 V
        if mod(i,2) == 0
            index_i = uint8(i / 2);
            index_j = uint8(j / 2);
            V(index_i,index_j) = 0.615 * r - 0.515 * g - 0.1 * b + 128;
        end
    end
end

filename = '/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/calibration_tool/front_dewarp.yuv';
fid=fopen(filename,'w');
count = fwrite(fid,Y','ubit8');
count = fwrite(fid,U','ubit8');
count = fwrite(fid,V','ubit8');
count = fwrite(fid,Y','ubit8');
count = fwrite(fid,U','ubit8');
count = fwrite(fid,V','ubit8');
fclose(fid);

%%%%%%%%%%%%%%%%%%%%%%%%

ColorImageRGB = imread('/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/fisheye_tool/AVM samples v.0.1/right_dewarp.png');
ColorImageYUV = rgb2ycbcr(ColorImageRGB);

[rows cols d] = size(ColorImageRGB);
dims = [cols rows];
dimsUV = uint8(dims / 2);
Yd = zeros(dimsUV);
UVd = zeros(dimsUV);

Y = Yd';
U = UVd';
V = UVd';
Y = uint8(Y);
U = uint8(U);
V = uint8(V);

%sample:420
for i = 1 : rows
    for j = 1 : cols
        %sample Y in every row
        r = ColorImageRGB(i,j,1);
        g = ColorImageRGB(i,j,2);
        b = ColorImageRGB(i,j,3);
        Y(i,j) = 0.299 * r + 0.587 * g + 0.114 * b + 16;
        %old line : sample 1/2 U
        if mod(i,2) == 1
            index_i = uint8(i / 2);
            index_j = uint8(j / 2);
            U(index_i,index_j) = -0.147 * r - 0.289 * g + 0.436 * b + 128;
        end
        %even line : sample 1/2 V
        if mod(i,2) == 0
            index_i = uint8(i / 2);
            index_j = uint8(j / 2);
            V(index_i,index_j) = 0.615 * r - 0.515 * g - 0.1 * b + 128;
        end
    end
end

filename = '/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/calibration_tool/right_dewarp.yuv';
fid=fopen(filename,'w');
count = fwrite(fid,Y','ubit8');
count = fwrite(fid,U','ubit8');
count = fwrite(fid,V','ubit8');
count = fwrite(fid,Y','ubit8');
count = fwrite(fid,U','ubit8');
count = fwrite(fid,V','ubit8');
fclose(fid);

%%%%%%%%%%%%%%%%%%%%%%%%%%%
ColorImageRGB = imread('/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/fisheye_tool/AVM samples v.0.1/rear_dewarp.png');
ColorImageYUV = rgb2ycbcr(ColorImageRGB);

[rows cols d] = size(ColorImageRGB);
dims = [cols rows];
dimsUV = uint8(dims / 2);
Yd = zeros(dimsUV);
UVd = zeros(dimsUV);

Y = Yd';
U = UVd';
V = UVd';
Y = uint8(Y);
U = uint8(U);
V = uint8(V);

%sample:420
for i = 1 : rows
    for j = 1 : cols
        %sample Y in every row
        r = ColorImageRGB(i,j,1);
        g = ColorImageRGB(i,j,2);
        b = ColorImageRGB(i,j,3);
        Y(i,j) = 0.299 * r + 0.587 * g + 0.114 * b + 16;
        %old line : sample 1/2 U
        if mod(i,2) == 1
            index_i = uint8(i / 2);
            index_j = uint8(j / 2);
            U(index_i,index_j) = -0.147 * r - 0.289 * g + 0.436 * b + 128;
        end
        %even line : sample 1/2 V
        if mod(i,2) == 0
            index_i = uint8(i / 2);
            index_j = uint8(j / 2);
            V(index_i,index_j) = 0.615 * r - 0.515 * g - 0.1 * b + 128;
        end
    end
end

filename = '/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/calibration_tool/rear_dewarp.yuv';
fid=fopen(filename,'w');
count = fwrite(fid,Y','ubit8');
count = fwrite(fid,U','ubit8');
count = fwrite(fid,V','ubit8');
count = fwrite(fid,Y','ubit8');
count = fwrite(fid,U','ubit8');
count = fwrite(fid,V','ubit8');
fclose(fid);


%%%%%%
ColorImageRGB = imread('/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/fisheye_tool/AVM samples v.0.1/left_dewarp.png');
ColorImageYUV = rgb2ycbcr(ColorImageRGB);

[rows cols d] = size(ColorImageRGB);
dims = [cols rows];
dimsUV = uint8(dims / 2);
Yd = zeros(dimsUV);
UVd = zeros(dimsUV);

Y = Yd';
U = UVd';
V = UVd';
Y = uint8(Y);
U = uint8(U);
V = uint8(V);

%sample:420
for i = 1 : rows
    for j = 1 : cols
        %sample Y in every row
        r = ColorImageRGB(i,j,1);
        g = ColorImageRGB(i,j,2);
        b = ColorImageRGB(i,j,3);
        Y(i,j) = 0.299 * r + 0.587 * g + 0.114 * b + 16;
        %old line : sample 1/2 U
        if mod(i,2) == 1
            index_i = uint8(i / 2);
            index_j = uint8(j / 2);
            U(index_i,index_j) = -0.147 * r - 0.289 * g + 0.436 * b + 128;
        end
        %even line : sample 1/2 V
        if mod(i,2) == 0
            index_i = uint8(i / 2);
            index_j = uint8(j / 2);
            V(index_i,index_j) = 0.615 * r - 0.515 * g - 0.1 * b + 128;
        end
    end
end

filename = '/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/calibration_tool/left_dewarp.yuv';
fid=fopen(filename,'w');
count = fwrite(fid,Y','ubit8');
count = fwrite(fid,U','ubit8');
count = fwrite(fid,V','ubit8');
count = fwrite(fid,Y','ubit8');
count = fwrite(fid,U','ubit8');
count = fwrite(fid,V','ubit8');
fclose(fid);

copyfile('/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/calibration_tool/InitialPerspectiveParams.c','/Users/dineshp/Dropbox/MATLAB/2d_calibration_tool/surroundview/InitialPerspectiveParams.c')