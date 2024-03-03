f=imread('../img/20220429160717.tiff');
g=f(:,:,1); 
t = [0.0625 0.1563]  
sigma = 1 
BW = edge(g, 'canny', [0.0625 0.1563] , 1); 
BW1 = edge(g, 'canny', [0.0625 0.1563] , 0.5); 
BW2 = edge(g, 'canny', [0.0625 0.1563] , 2); 
BW3 = edge(g, 'canny', [0.01 0.1] , 1); 
imshow(g) 
figure 
subplot(2,2,1); 
imshow(BW); 
title(' sigma= 1, T= [0.0625 0.1563]') 
subplot(2,2,2); 
imshow(BW1); title(' sigma= 0.5, T= [0.0625 0.1563]') 
subplot(2,2,3); imshow(BW2); 
title(' sigma= 2, T= [0.0625 0.1563]') 
subplot(2,2,4); 
imshow(BW3); 
title(' sigma= 1, T= [0.01 0.1]') 