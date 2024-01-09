% Đọc ảnh gốc
Ig = imread('../img/20220429160717.tiff');

% Lọc Sobel theo phương ngang  
Gx = edge(Ig,'sobel');

% Lọc Sobel theo phương dọc
Gy = edge(Ig,'sobel',90);

% Tính gradient tổng hợp 
G = sqrt(Gx.^2 + Gy.^2);

% Chuẩn hóa giá trị gradient
G_norm = mat2gray(G);

% Hiển thị kết quả
figure;
imshow(G_norm);
title('Ảnh Xquang sau xử lý Sobel');