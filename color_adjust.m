% ͼ�񱥺Ͷȵ���
function img_res = color_adjust(img)
    img_double = double(img);
    img_gray = double(rgb2gray(img));
    S_template = img_double;
    % ʹ��ԭʼͼ��ĻҶ�ͼ����Ϊģ�壬����ɲ�ֵ������
    S_template(:,:,1)=img_gray; 
    S_template(:,:,2)=img_gray;
    S_template(:,:,3)=img_gray;
    % ��ֵ������ 
    img_res = (-1).*S_template  +2.*img_double;
    img_res = uint8(img_res);
end