function Feature4Extraction()
[input1, input2, input3] = textread('Char_Index.txt','%d %d %s',1000, 'headerlines',1);%��ȡͼƬ�ı�ţ������Ϣ���ļ���
indexFileName = input3;%����ļ���
fid=fopen('feature4.txt','w+');%��feature1.txt�����Դ�������1������
for k=1:1000 %��1000��ͼƬ
A=imread(strcat('Char_Image_Binary\',char(indexFileName(k,1))));%����ͼƬ
t=graythresh(A); %ȡ��ֵ
B=im2bw(A,t);%��ֵ����BΪ��ֵ�����ͼ�����ÿ��Ԫ�ص�ֵΪ0��1
[a,b]=size(B);

fprintf(fid,'%d',k);
fprintf(fid,'%s','       ');

%����ͳ���߶���
temp=0; %ʹ��temp��Ϊ����Ƿ�����
for i=1:a
    line=0;
    for j=1:b
        if(B(i,j)==1)&(temp==0)
            line=line+1;
            temp=1; %��λ�����ظ�����
        elseif(B(i,j)==0)&(temp==1)
            temp=0;
        end
    end
    fprintf(fid,'%d',line);
    fprintf(fid,',');
end

%����ͳ���߶���
temp=0; %ʹ��temp��Ϊ����Ƿ�����
for j=1:b
    line=0;
    for i=1:a
        if(B(i,j)==1)&(temp==0)
            line=line+1;
            temp=1; %��λ�����ظ�����
        elseif(B(i,j)==0)&(temp==1)
            temp=0;
        end
    end
    fprintf(fid,'%d',line);
    
    if (j ~=b)
        fprintf(fid,',');
    end
end

if k~=1000
fprintf(fid,'\n');%��Ϊ���һ�У���ÿ��ĩβ�ӻس�
end

end
fclose(fid);%�ر��ļ�
