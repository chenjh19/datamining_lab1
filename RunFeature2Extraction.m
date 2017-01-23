function RunFeature2Extraction()
fid=fopen('Runfeature2.txt','w+');

step = 8; %���÷��鲽��
k=1;
A=imread('out.jpg');%����ͼƬ
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

if k~=1
fprintf(fid,'\n');%��Ϊ���һ�У���ÿ��ĩβ�ӻس�
end

fclose(fid);%�ر��ļ�
