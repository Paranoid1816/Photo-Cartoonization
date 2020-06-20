clc,clear,close all;

img = imread('image path here');
figure,subplot(2,2,1),imshow(img);
title('ԭʼͼ��')

img = double(img)/255;
result = bilateral_filter(double(img),8,[3 0.1]);
subplot(2,2,2),imshow(result);
title('˫���˲���')

result = edge_detect(result);
subplot(2,2,3),imshow(result);
title('��Ե����')

result = color_adjust(result);
subplot(2,2,4),imshow(result);
title('��ɫ����')
imwrite(result,'result.bmp')