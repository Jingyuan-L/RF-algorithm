%ǰ�������� ���빤����datasets ���������BPANNresults
%��TY��TESTY��1��2������ ����������������෴ ������1�� 2û��
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
%���ݹ�һ����ת��Ϊÿһ��Ϊһ������
test_dataset=[TO;TESTO];
[dataset_scale,ps]=mapminmax(test_dataset',0,1);
%dataset_scale=dataset_scale';
TO=dataset_scale(:,1:400);
TESTO=dataset_scale(:,401:567);
[TY1,OPS]=mapminmax(TY',0,1);
%ѵ��
net1=newff(TO,TY1,[1]);
net1=train(net1,TO,TY1);
%����
predictYO1=sim(net1,TESTO);
%����һ��
i=0;
predictYO=zeros(167,1);
while i<167
    i=i+1;
    if predictYO1(i)<0.5
        predictYO(i)=1;
    else
        predictYO(i)=2;
    end
end

%��������
[CLMat1, order1] = confusionmat(TESTY, predictYO)
P1=CLMat1(1,1)/(CLMat1(1,1)+CLMat1(1,2))
R1=CLMat1(1,1)/(CLMat1(1,1)+CLMat1(2,1))
F11=2*P1*R1/(P1+R1)

%PCA����
%���ݹ�һ��
test_dataset2=[TPCA;TESTPCA];
[dataset_scale2,ps]=mapminmax(test_dataset2',0,1);
%dataset_scale2=dataset_scale2';
TPCA=dataset_scale2(:,1:400);
TESTPCA=dataset_scale2(:,401:567);

%ѵ��
net2=newff(TPCA,TY1,[1]);
net2=train(net2,TPCA,TY1);
%����
predictYPCA1=sim(net2,TESTPCA);
%����һ��
i=0;
predictYPCA=zeros(167,1);
while i<167
    i=i+1;
    if predictYPCA1(i)<0.5
        predictYPCA(i)=1;
    else
        predictYPCA(i)=2;
    end
end
%��������
[CLMat2, order2] = confusionmat(TESTY, predictYPCA)
P2=CLMat2(1,1)/(CLMat2(1,1)+CLMat2(1,2))
R2=CLMat2(1,1)/(CLMat2(1,1)+CLMat2(2,1))
F12=2*P2*R2/(P2+R2)