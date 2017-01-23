function RunSVM()
clc; %����
clear all; %�建

fid = fopen('RunFeature2.txt');
fout=fopen('RunSVMOut.txt','w+');

c = textscan(fid,'%f','delimiter',',');
d = c{1,1}; %��Ϊ�°潨����textscan����textscanȴҪתһ��
feature_matrix_predict = d'; % '��������ת��
feature_matrix_predict(:,[1])=[]; %ȥ����һ�еı��

% save model.mat model;
load('model2_Inv.mat','model');
fmp1=feature_matrix_predict(1,:);
predict_label = svmpredict(1, feature_matrix_predict, model); %��˵��label�ǿ�������
predict_label

CharNo = [10 11 12 20 22 25 26 28 30 31 32 33 34];
CharTrans = ['��' '��' '��' '0' '2' '5' '6' '8' 'A' 'B' 'C' 'D' 'Q'];
for i = 1:length(CharNo)
    if predict_label > 100
        predict_label = predict_label -100;
    end
    if predict_label == CharNo(i);
        fprintf(fout,'%s',CharTrans(i));
    end
end
