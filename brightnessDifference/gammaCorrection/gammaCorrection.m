folder_path = '../../img/';
img_files = dir(fullfile(folder_path, '*.tiff'));

for i = 1:numel(img_files)
    img_path = fullfile(folder_path, img_files(i).name);
    img = imread(img_path);

    gamma_value = 0.6;
    gamma_corrected_image = imadjust(img, [], [], gamma_value);

        
    % Hiển thị ảnh gốc và ảnh đã xử lý
    figure;
    subplot(2, 1, 1);
    imshow(img);
    title('Ảnh Gốc');
    
    subplot(2, 1, 2);
    imshow(gamma_corrected_image);
    title('Ảnh Sau Low-pass Filtering');
    
    % Chuyển đổi ảnh về kiểu dữ liệu uint8
    img_histeq_uint8 = im2uint8(gamma_corrected_image);

    % Tạo tên tệp mới để lưu ảnh đã chuẩn hóa histogram
    [~, name, ext] = fileparts(img_files(i).name);
    new_filename = [name '_result' ext];

    % Lưu ảnh đã chuẩn hóa histogram
    imwrite(img_histeq_uint8, fullfile('result', new_filename));
end