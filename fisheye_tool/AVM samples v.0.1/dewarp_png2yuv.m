%%
clc;
ColorImageRGB = imread('front_dewarp.png');
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

filename = 'front_dewarp.yuv';
fid=fopen(filename,'w');
count = fwrite(fid,Y','ubit8');
count = fwrite(fid,U','ubit8');
count = fwrite(fid,V','ubit8');
count = fwrite(fid,Y','ubit8');
count = fwrite(fid,U','ubit8');
count = fwrite(fid,V','ubit8');
fclose(fid);

%%%%%%%%%%%%%%%%%%%%%%%%

ColorImageRGB = imread('right_dewarp.png');
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

filename = 'right_dewarp.yuv';
fid=fopen(filename,'w');
count = fwrite(fid,Y','ubit8');
count = fwrite(fid,U','ubit8');
count = fwrite(fid,V','ubit8');
count = fwrite(fid,Y','ubit8');
count = fwrite(fid,U','ubit8');
count = fwrite(fid,V','ubit8');
fclose(fid);

%%%%%%%%%%%%%%%%%%%%%%%%%%%
ColorImageRGB = imread('rear_dewarp.png');
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

filename = 'rear_dewarp.yuv';
fid=fopen(filename,'w');
count = fwrite(fid,Y','ubit8');
count = fwrite(fid,U','ubit8');
count = fwrite(fid,V','ubit8');
count = fwrite(fid,Y','ubit8');
count = fwrite(fid,U','ubit8');
count = fwrite(fid,V','ubit8');
fclose(fid);


%%%%%%
ColorImageRGB = imread('left_dewarp.png');
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

filename = 'left_dewarp.yuv';
fid=fopen(filename,'w');
count = fwrite(fid,Y','ubit8');
count = fwrite(fid,U','ubit8');
count = fwrite(fid,V','ubit8');
count = fwrite(fid,Y','ubit8');
count = fwrite(fid,U','ubit8');
count = fwrite(fid,V','ubit8');
fclose(fid);
