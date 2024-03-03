clc; 
close all;

I = imread('../../../img/20220429160717.tiff');

% thêm nhiễu
I = imnoise(I, 'gaussian', 0.1);
%I = imnoise(I,'speckle',0.1);
%I = imnoise(I,'salt & pepper',0.1);

figure(1), imshow(I); title('Img');

% sử dụng lọc trung bình median filter
tic
disp('---------');
disp('median filter');
K = medfilt2(I);
figure(2), imshow(K); title('Median Filter');
toc

% sử dụng wiener2 filter
tic
disp('---------');
disp('wiener2 filter');
J = im2gray(I);
K = wiener2(J,[5 5]);
figure(3), imshow(K); title('wiener2 Filter');
toc

% sử dụng imdiffusefilt (lọc khuếch tán)
tic
disp('---------');
disp('imdiffusefilt');
K = imdiffusefilt(I);
figure(4), imshow(K); title('imdiffusefilt Filter');
toc

% sử dụng Wavelet
%tic
%disp('imdiffusefilt');
%K = wdenoise2(I);
%figure(5), imshow(K); title('Wavelet Filter');
%toc

% sử dụng imgaussfilt (lọc khuếch tán)
tic
disp('---------');
disp('imgaussfilt');
K = imgaussfilt(I,2);
figure(5), imshow(K); title('imgaussfilt Filter');
toc
