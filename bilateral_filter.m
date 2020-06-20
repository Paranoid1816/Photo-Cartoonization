% ˫���˲�����
function img_f = bilateral_filter(img,d,arg) 
    img = applycform(img,makecform('srgb2lab'));  
    [x,y,~]=size(img);
    img_f=zeros(x,y);
    % ��������ͼ��߽磬��֤���ɺ�ͼ����ԭ��ͼ��ά��һ��
    extract = extract_region(img,d,x,y);
    length = 2*d+1;
    % ����ŷʽ���룬�ø�˹�����������Ȩ��
    G = fspecial('gaussian',[length,length],arg(1));
    S = zeros(length,length);
	% ��ͼ���������ֵȨ��
    for i=1+d:x+d  
        for j=1+d:y+d
        	% ��ɫͼ�����ͨ�����м���
            rawvalue = extract(i-d:i+d,j-d:j+d,1:3);   
            da = rawvalue(:,:,1)-extract(i,j,1);  
            db = rawvalue(:,:,2)-extract(i,j,2);  
            dc = rawvalue(:,:,3)-extract(i,j,3);  
            S = exp(-(da.^2+db.^2+dc.^2)/(2*(arg(2)*100)^2));  
            % ������Ȩ��
            H = S.*G;  
            % Ȩ�ع�һ��
            H = H./sum(H(:));  
            % �������ֵ
            img_f(i-d,j-d,1) = sum(sum(rawvalue(:,:,1).*H));   
            img_f(i-d,j-d,2) = sum(sum(rawvalue(:,:,2).*H));      
            img_f(i-d,j-d,3) = sum(sum(rawvalue(:,:,3).*H));   
        end   
    end  
    img_f = applycform(img_f,makecform('lab2srgb'));  
end

% ����ͼ��߽�
function extract = extract_region(img,w,x,y)
    extract = zeros(x + 2 * w, y + 2 * w, 3); 
    % �м䱣��ԭͼ��
    extract(w +1:w + x,w + 1:w + y,1:3) = img;  
    % ���ֱܷ�����ֵΪ(���ڱ߳�+1)/2
    extract(1:w,w + 1:w + y,1:3) = img(w:-1:1,:,1:3);  
    extract(end - w:end,w + 1:w + y,1:3) = img(end:-1:end - w,:,1:3);  
    extract(:,1:w,1:3) = extract(:,2 * w:-1:w + 1,1:3);  
    extract(:,y + w+1:y + 2*w,1:3) = extract(:,y + w:-1:y + 1,1:3);  
end