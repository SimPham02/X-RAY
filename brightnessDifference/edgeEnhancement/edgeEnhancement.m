folder_path = '../../img/';
img_files = dir(fullfile(folder_path, '*.tiff'));

for i = 1:numel(img_files)
    img_path = fullfile(folder_path, img_files(i).name);
    img = imread(img_path);
    
    %Tạo ma trận 3x3 và các phần tử bằng -1
    kernel = -1*ones(3);
    kernel(2,2) = 11;
    enhancedImage = imfilter(img, kernel);

        
    % Hiển thị ảnh gốc và ảnh đã xử lý
    figure;
    subplot(2, 1, 1);
    imshow(img);
    title('Ảnh Gốc');
    
    subplot(2, 1, 2);
    imshow(enhancedImage);
    title('Ảnh Sau xử lý');
    
    % Chuyển đổi ảnh về kiểu dữ liệu uint8
    img_histeq_uint8 = im2uint8(enhancedImage);

    % Tạo tên tệp mới để lưu ảnh đã chuẩn hóa histogram
    [~, name, ext] = fileparts(img_files(i).name);
    new_filename = [name '_result' ext];

    % Lưu ảnh đã chuẩn hóa histogram
    imwrite(img_histeq_uint8, fullfile('result', new_filename));
end