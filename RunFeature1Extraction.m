function RunFeature1Extraction()
fid=fopen('RunFeature1.txt','w+');%��feature1.txt�����Դ�������1������
A=imread('out.jpg');%����ͼƬ
t=graythresh(A); %ȡ��ֵ
B=im2bw(A,t);%��ֵ����BΪ��ֵ�����ͼ�����ÿ��Ԫ�ص�ֵΪ0��1
[a,b]=size(B);
C=zeros(1,a+b);%������������

k=1;

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
if k~=1
fprintf(fid,'%d\n',C(1,a+b));%��Ϊ���һ�У���ÿ��ĩβ�ӻس�
else
fprintf(fid,'%d',C(1,a+b)); %���һ���򲻼�
end

fclose(fid);%�ر��ļ�
