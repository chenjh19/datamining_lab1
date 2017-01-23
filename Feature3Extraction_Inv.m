function Feature3Extraction_Inv()
[input1, input2, input3] = textread('Char_Index.txt','%d %d %s',1000, 'headerlines',1);%��ȡͼƬ�ı�ţ������Ϣ���ļ���
indexFileName = [input3;input3];%����1000
fid=fopen('feature3_Inv.txt','w+');%��feature1.txt�����Դ�������1������

for k=1:2000 %��2000��ͼƬ
    if k<1001
        A=imread(strcat('Char_Image_Binary\',char(indexFileName(k,1))));%����ͼƬ
    else
        A=imread(strcat('Char_Image_Binary_Inv\',char(indexFileName(k,1))));%����ͼƬ
    end
t=graythresh(A); %ȡ��ֵ
B=im2bw(A,t);%��ֵ����BΪ��ֵ�����ͼ�����ÿ��Ԫ�ص�ֵΪ0��1
[a,b]=size(B);

fprintf(fid,'%d',k);
fprintf(fid,'%s','       ');

%�״γ��ְ׵�λ��-��
% fprintf(fid,'L ');
for i = 1:a
    temp = 0; %�״γ��ְ׵�λ��
    for j = 1:b
        if(B(i,j) == 1)
            fprintf(fid,'%d,',temp);
            break;
        else
            temp = temp+1;
        end
    end
    
    if(temp == b)
            fprintf(fid,'%d,',b);
    end
 end

%�״γ��ְ׵�λ��-��
% fprintf(fid,'R ');
for i = 1:a
    temp = 0; %�״γ��ְ׵�λ��
    for j = b:-1:1
        if(B(i,j) == 1)
            fprintf(fid,'%d,',temp);
            break;
        else
            temp = temp+1;
        end
    end
    
    if(temp == b)
            fprintf(fid,'%d,',b);
    end
 end

%�״γ��ְ׵�λ��-��
% fprintf(fid,'U ');
for j = 1:b
    temp = 0; %�״γ��ְ׵�λ��
    for i = 1:a
        if(B(i,j) == 1)
            fprintf(fid,'%d,',temp);
            break;
        else
            temp = temp+1;
        end
    end
    
    if(temp == a)
            fprintf(fid,'%d,',a);
    end
end

%�״γ��ְ׵�λ��-��
% fprintf(fid,'D ');
for j = 1:b
    temp = 0; %�״γ��ְ׵�λ��
    for i = a:-1:1
        if(B(i,j) == 1)
            fprintf(fid,'%d',temp);
            break;
        else
            temp = temp+1;
        end
    end
    
    if(temp == a)
            fprintf(fid,'%d',a);
    end
    
    if(j ~= b)
        fprintf(fid,',');
    end
end

if k~=2000
fprintf(fid,'\n');%��Ϊ���һ�У���ÿ��ĩβ�ӻس�
end

end
fclose(fid);%�ر��ļ�
