clc; %����
clear all; %�建��

fid = fopen('feature6.txt');
ferror = fopen('error.txt','w');
C = textscan(fid,'%d','delimiter',',');
D = C{1,1}; %��Ϊ�°潨����textscan����textscanȴҪתһ��
feature_matrix = zeros(1000,length(D)/1000);
for i = 1:1000
    for j = 1:(length(D)/1000)
        feature_matrix(i,j) = D(j+(i-1)*(length(D)/1000));
    end
end
feature_matrix(:,[1])=[]; %ȥ����һ�еı��

fchar_index = fopen('Char_Index.txt');
Index = textscan(fchar_index,'%f %f %s',1000,'delimiter','\t','HeaderLines',1);
char_index = Index{1,2};
char_file_name = Index{1,3};

char_index_predict = zeros(200,1);
char_file_name_predict = {};
char_index_train = zeros(800,1);
it=1;
ip=1;
for i =1:1000
    if rem(i,5)==0
        char_index_predict(ip) = char_index(i);
        char_file_name_predict(ip) = char_file_name(i);
        feature_matrix_predict(ip,:) = feature_matrix(i,:); %���и���
        ip = ip+1;
    else
        char_index_train(it) = char_index(i);
        feature_matrix_train(it,:) = feature_matrix(i,:); %���и���
        it = it+1;
    end
end

% model = svmtrain(char_index, feature_matrix);
% [predict_label, accuracy, dec_values] = svmpredict(char_index, feature_matrix, model);

model = svmtrain(char_index_train,  feature_matrix_train,'-t 1 -d 3 -g 0.01 -r 2');
% save model.mat model;
% load model.mat model;
[predict_label, accuracy, dec_values] = svmpredict(char_index_predict, feature_matrix_predict, model);


noCorrect = []; %��ʼ��
for i = 1:200
    if char_index_predict(i) ~= predict_label(i) %matlabȡ����~������!
        noCorrect =[noCorrect; i char_file_name_predict(i) char_index_predict(i) predict_label(i)];
         fprintf(ferror, '%d %s %d %d\n', i, char(char_file_name_predict(i)), char_index_predict(i), predict_label(i));
    end
end

noCorrect

% 
% fmp1=feature_matrix_predict(1,:);
% 
% predict_label = svmpredict(1, fmp1, model); %��˵��label�ǿ�������
% predict_label