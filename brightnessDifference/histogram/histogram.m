folder_path = '../../img/';

% lấy danh sách ảnh
img_files = dir(fullfile(folder_path, '*.tiff'));

% lặp qua ảnh
for i = 1:numel(img_files)
    % đọc ảnh
    img_path = fullfile(folder_path, img_files(i).name);
    img = imread(img_path);

    % sử dụng histeq để chuẩn hoá histogram
    img_histeq = histeq(img);

    % Hiển thị và lưu ảnh gốc và ảnh đã chuẩn hóa histogram
    figure;
    subplot(2, 1, 1);
    imshow(img);
    title('Ảnh Gốc');

    subplot(2, 1, 2);
    imshow(img_histeq);
    title('Ảnh Chuẩn Hóa Histogram');

    % Chuyển đổi ảnh về kiểu dữ liệu uint8
    img_histeq_uint8 = im2uint8(img_histeq);

    % Tạo tên tệp mới để lưu ảnh đã chuẩn hóa histogram
    [~, name, ext] = fileparts(img_files(i).name);
    new_filename = [name '_histeq' ext];

    % Lưu ảnh đã chuẩn hóa histogram
    imwrite(img_histeq_uint8, fullfile('result', new_filename));
end
