function Feature5Extraction_Inv()
[input1, input2, input3] = textread('Char_Index.txt','%d %d %s',1000, 'headerlines',1);%��ȡͼƬ�ı�ţ������Ϣ���ļ���
indexFileName = [input3;input3];%����1000
fid=fopen('feature5_Inv.txt','w+');%��feature1.txt�����Դ�������1������

step = 4; %���÷��鲽��
for k=1:2000 %��2000��ͼƬ
    if k<1001
        A=imread(strcat('Char_Image_Binary\',char(indexFileName(k,1))));%����ͼƬ
    else
        A=imread(strcat('Char_Image_Binary_Inv\',char(indexFileName(k,1))));%����ͼƬ
    end
t=graythresh(A); %ȡ��ֵ
B=im2bw(A,t);%��ֵ����BΪ��ֵ�����ͼ�����ÿ��Ԫ�ص�ֵΪ0��1
[a,b]=size(B);
countSquare = ceil(a/step) * ceil (b/step); %ceilΪ����ȡ�������㹲���ٸ�����

fprintf(fid,'%d',k);
fprintf(fid,'%s','       ');

count = 0; %�������
for i = 1:step:a
    for j = 1:step:b
        temp = 0; %�׵����
        count = count+1;
        
        %������step��ҲҪ��
        if(a-i > step)
            i2f = step;
        elseif(a-i < step)
            i2f = a-i+1;
        end

        if(b-j > step)
            j2f = step;
        else
            j2f = b-j+1;
        end
        
        for i2 = 0:i2f-1
            for j2 = 0:j2f-1
                if(B(i+i2,j+j2) == 1)
                  temp = temp+1;%�����а�ɫ����
                end
            end
        end
        %������
%         fprintf(fid,'%d',i2f);
%         fprintf(fid,'*');
%         fprintf(fid,'%d',j2f);
%         fprintf(fid,':');

        fprintf(fid,'%d',temp);        
        if(countSquare ~= count)
            fprintf(fid,',');
%             fprintf(fid,'\t');
        end
    end
end
%������
% fprintf(fid,'count:');
% fprintf(fid,'%d',count);
% fprintf(fid,'\n');

if k~=2000
fprintf(fid,'\n');%��Ϊ���һ�У���ÿ��ĩβ�ӻس�
end

end
fclose(fid);%�ر��ļ�
