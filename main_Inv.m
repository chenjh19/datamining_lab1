tic;
PreProcessing();%Ԥ������Ҫ�����ͼ��ת���ɶ�ֵͼ
PreProcessingToCorrect();%��û����ȷת����ͼ������ֹ�У��
PreProcessingTo_Inv();%��û����ȷת����ͼ������ֹ�У��

% Feature1Extraction_Inv();%��ȡ����1��Ϊÿһ�к�ÿһ�еİ׵���
% Feature2Extraction_Inv();%��ȡ����2��Ϊ�����ܶȣ������СΪ8*8
% Feature3Extraction_Inv();%��ȡ����3��Ϊ�ַ�����������߽�ľ��룬
% Feature4Extraction_Inv();%��ȡ����4��Ϊÿһ�к�ÿһ�е��߶���Ŀ
% Feature5Extraction_Inv();%��ȡ����5��Ϊ�����ܶȣ������СΪ4*4
% Feature6Extraction_Inv();%��ȡ����6��Ϊ�����ܶȣ������СΪ6*6

%���߳�ִ��
funList = {@Feature1Extraction_Inv,@Feature2Extraction_Inv,@Feature3Extraction_Inv,@Feature4Extraction_Inv,@Feature5Extraction_Inv,@Feature6Extraction_Inv};
% parpool open 

parfor i=1:length(funList)
    %# call the function
    funList{i}();
end


train_inv();
toc%�����������ʱ��