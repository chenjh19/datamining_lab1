function Run()
tic;
RunPreProcessing();
RunFeature2Extraction();
RunSVM();
toc;
exit; %Ϊ������������ӵ�
