% ��ȡͼ���Ե
function img_f = edge_detect(img)
    img_gray = rgb2gray(img);
    % �趨Ϊsobel���ӣ���ֵΪ0.02
    edge_m = uint8(edge(img_gray, 'sobel', 0.02));
    img_blur = uint8(img*255);
    % ��ÿ��ͼ���ȥ��Ե
    img_f(:,:,1) = img_blur(:,:,1) - img_blur(:,:,1) .* edge_m;
    img_f(:,:,2) = img_blur(:,:,2) - img_blur(:,:,2) .* edge_m;
    img_f(:,:,3) = img_blur(:,:,3) - img_blur(:,:,3) .* edge_m;
end