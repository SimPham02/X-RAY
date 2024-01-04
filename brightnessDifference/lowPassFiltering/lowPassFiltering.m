folder_path = '../../img/';

% lấy danh sách ảnh
img_files = dir(fullfile(folder_path, '*.tiff'));

for i = 1:numel(img_files)
    img_path = fullfile(folder_path, img_files(i).name);
    img = imread(img_path);

    % ma trận gaussian
    filter = fspecial('gaussian', [7 7], 2);
    
    % Áp dụng ma trận lọc Gaussian lên ảnh
    output_image = imfilter(img, filter);
    output_image = output_image * 3.5;
    
    % Hiển thị ảnh gốc và ảnh đã xử lý
    figure;
    subplot(2, 1, 1);
    imshow(img);
    title('Ảnh Gốc');
    
    subplot(2, 1, 2);
    imshow(output_image);
    title('Ảnh Sau Low-pass Filtering');
    
    % Chuyển đổi ảnh về kiểu dữ liệu uint8
    img_histeq_uint8 = im2uint8(output_image);

    % Tạo tên tệp mới để lưu ảnh đã chuẩn hóa histogram
    [~, name, ext] = fileparts(img_files(i).name);
    new_filename = [name '_result' ext];

    % Lưu ảnh đã chuẩn hóa histogram
    imwrite(img_histeq_uint8, fullfile('result', new_filename));
end