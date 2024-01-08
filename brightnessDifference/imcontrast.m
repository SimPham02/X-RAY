img = imread('../img/20220429160717.tiff');

c = img(:,:,1);
output = imadjust(c)
subplot(1,2,1)
imshow(c)
subplot(1,2,2)
imshow(output)