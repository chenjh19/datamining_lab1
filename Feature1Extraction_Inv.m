function Feature1Extraction_Inv()
[input1, input2, input3] = textread('Char_Index.txt','%d %d %s',1000, 'headerlines',1);%��ȡͼƬ�ı�ţ������Ϣ���ļ���
indexFileName = [input3;input3]; %  ����1000
fid=fopen('feature1_Inv.txt','w+'); % ��feature1.txt�����Դ�������1������
for k=1:2000 %��2000��ͼƬ
    if k<1001
        A=imread(strcat('Char_Image_Binary\',char(indexFileName(k,1))));%����ͼƬ
    else
        A=imread(strcat('Char_Image_Binary_Inv\',char(indexFileName(k,1))));%����ͼƬ
    end
    
t=graythresh(A); %ȡ��ֵ
B=im2bw(A,t);%��ֵ����BΪ��ֵ�����ͼ�����ÿ��Ԫ�ص�ֵΪ0��1
[a,b]=size(B);
C=zeros(1,a+b);%������������

for i=1:a
    for j=1:b
        if(B(i,j)==1)
            C(1,i)=C(1,i)+1;%������е�Ԫ��Ϊ��ɫ��������1�����ս��Ϊÿһ�еİ׵���
        end
    end
end

for j=1:b
    for i=1:a
        if(B(i,j)==1)
            C(1,a+j)=C(1,a+j)+1;%���ս��Ϊÿһ�еİ׵���
        end
    end
end


fprintf(fid,'%d',k);
fprintf(fid,'%s','       ');
for i=1:a+b-1
  fprintf(fid,'%d',C(1,i));%����������д���ı�
  fprintf(fid,'%s',',');%�ö��Ÿ���
end
if k~=2000
fprintf(fid,'%d\n',C(1,a+b));%��Ϊ���һ�У���ÿ��ĩβ�ӻس�
else
fprintf(fid,'%d',C(1,a+b)); %���һ���򲻼�
end

end
fclose(fid);%�ر��ļ�
