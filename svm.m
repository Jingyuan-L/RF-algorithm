%֧�������� ���빤����datasets ���������SVMresults
%��TY��TESTY��1��2������ ����������������෴
i=0;
while i<400
    i=i+1;
    if TY(i)==1
        TY(i)=2;
    else
        TY(i)=1;
    end
end
i=0;
while i<167
    i=i+1;
    if TESTY(i)==1
        TESTY(i)=2;
    else
        TESTY(i)=1;
    end
end

%ԭʼ����
%���ݹ�һ��
test_dataset=[TO;TESTO];
[dataset_scale,ps]=mapminmax(test_dataset',0,1);
dataset_scale=dataset_scale';
TO=dataset_scale(1:400,:);
TESTO=dataset_scale(401:567,:);
%SVMѵ��
svm1=svmtrain(TO,TY,'kernel_function','rbf');
%����
predictYO=svmclassify(svm1,TESTO);
%��������
[CLMat1, order1] = confusionmat(TESTY, predictYO)
P1=CLMat1(1,1)/(CLMat1(1,1)+CLMat1(1,2))
R1=CLMat1(1,1)/(CLMat1(1,1)+CLMat1(2,1))
F11=2*P1*R1/(P1+R1)

%PCA����
%���ݹ�һ��
test_dataset2=[TPCA;TESTPCA];
[dataset_scale2,ps]=mapminmax(test_dataset2',0,1);
dataset_scale2=dataset_scale2';
TPCA=dataset_scale2(1:400,:);
TESTPCA=dataset_scale2(401:567,:);
%SVMѵ��
svm2=svmtrain(TPCA,TY,'kernel_function','rbf');
%����
predictYPCA=svmclassify(svm2,TESTPCA);
%��������
[CLMat2, order2] = confusionmat(TESTY, predictYPCA)
P2=CLMat2(1,1)/(CLMat2(1,1)+CLMat2(1,2))
R2=CLMat2(1,1)/(CLMat2(1,1)+CLMat2(2,1))
F12=2*P2*R2/(P2+R2)