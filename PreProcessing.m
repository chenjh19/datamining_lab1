function PreProcessing()
[input1, input2, input3] = textread('Char_Index.txt','%d %d %s',1000, 'headerlines',1);
indexFileName = input3;
parfor k=1:1000
A=imread(strcat('Char_Image\',char(indexFileName(k,1)))); %��ȡͼ��
A=rgb2gray(A);
A=histeq(A); % ֱ��ͼ��ֵ��
A=medfilt2(A,[3 3]);
t=graythresh(A); %ʹ�������䷽������һ����ֵ�������ֵ��[0, 1]��Χ�ڡ� ����ֵ���Դ��ݸ�im2bw��ɻҶ�ͼ��ת��Ϊ��ֵͼ��Ĳ����� �����䷽���һ������Ӧ����ֵȷ���ķ���,���ǰ�ͼ��ĻҶ�����,��ͼ��ֳɱ�����Ŀ��2���֡�������Ŀ��֮�����䷽��Խ��,˵������ͼ���2���ֵĲ��Խ��,������Ŀ����Ϊ�����򲿷ֱ������ΪĿ�궼�ᵼ��2���ֲ���С�����,ʹ��䷽�����ķָ���ζ�Ŵ�ָ�����С�� 
% A=adapthisteq(A); % ����Ӧֱ��ͼ��ֵ��
B=im2bw(A,t); %ʹ�øղŵ���ֵת���ɶ�ֵͼ��
[a,b]=size(B); %��ȡͼ��Ĵ�С

if(B(1,1)+B(1,b)+B(a,1)+B(a,b)>=2) %ͼ����ĸ���λ�������2�������ǰ�ɫ������ͼ��ķ������
    for i=1:a
        for j=1:b
            B(i,j)=1-B(i,j);
        end
    end
end
imwrite(B,strcat('Char_Image_Binary\',char(indexFileName(k,1)))); %д���ֵͼ��
end
