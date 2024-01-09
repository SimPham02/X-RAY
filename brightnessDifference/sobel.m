img_input = imread('../img/20220429160717.tiff');
img = img_input; % No need for rgb2gray

subplot(1,3,1)
imshow(img_input); title('input_image');

% Convert the image to double  
y = double(img);  
filtered_image = zeros(size(y)); 

% Sobel Operator Mask  
Mx = [1 0 -1; 2 0 -2; 1 0 -1];
My = [1 2 1; 0 0 0; -1 -2 -1];

for i = 1:size(y, 1) - 2      
    for j = 1:size(y, 2) - 2            
        % Gradient approximations          
        Gx = sum(sum(Mx .* y(i:i+2, j:j+2)));          
        Gy = sum(sum(My .* y(i:i+2, j:j+2)));                            
        % Calculate magnitude of vector          
        filtered_image(i+1, j+1) = sqrt(Gx.^2 + Gy.^2);                
    end 
end 

% Displaying Filtered Image  
filtered_image = uint8(filtered_image);
subplot(1,3,2)
imshow(filtered_image); title('Filtered Image');     

% Define a threshold value  
thresholdValue = 100; 
% Varies between [0 255]  
output_image = max(filtered_image, thresholdValue);  
output_image(output_image == round(thresholdValue)) = 0;     
    
% Displaying Output Image  
output_image = imbinarize(output_image); 
subplot(1,3,3)
imshow(output_image); 
title('Edge Detected Image');