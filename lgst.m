%�������ʻع� ���빤����datasets ���������LGSTresults
%��TY��TESTY��1��2������ ����������������෴ ԭ1û��2�� �� ��Ϊ0�� 1û��
i=0;
while i<400
    i=i+1;
    if TY(i)==1
        continue;
    else
        TY(i)=0;
    end
end
i=0;
while i<167
    i=i+1;
    if TESTY(i)==1
        continue;
    else
        TESTY(i)=0;
    end
end

%ԭʼ����
lgst1 = glmfit(TO,TY,'binomial', 'link', 'logit'); %���߼��ع�������ϵ������
logitFit = glmval(lgst1,TESTO, 'logit'); %���߼��ع�Ľ��Ԥ����Լ��Ľ��
%����һ��
i=0;
predictYO=zeros(167,1);
while i<167
    i=i+1;
    if logitFit(i)<0.5
        predictYO(i)=0;
    else
        predictYO(i)=1;
    end
end
%��������
[CLMat1, order1] = confusionmat(TESTY, predictYO)
P1=CLMat1(1,1)/(CLMat1(1,1)+CLMat1(1,2))
R1=CLMat1(1,1)/(CLMat1(1,1)+CLMat1(2,1))
F11=2*P1*R1/(P1+R1)

%PCA����
lgst2 = glmfit(TPCA,TY,'binomial', 'link', 'logit'); %���߼��ع�������ϵ������
logitFit2 = glmval(lgst2,TESTPCA, 'logit'); %���߼��ع�Ľ��Ԥ����Լ��Ľ��
%����һ��
i=0;
predictYPCA=zeros(167,1);
while i<167
    i=i+1;
    if logitFit2(i)<0.5
        predictYPCA(i)=0;
    else
        predictYPCA(i)=1;
    end
end
%��������
[CLMat2, order2] = confusionmat(TESTY, predictYPCA)
P2=CLMat2(1,1)/(CLMat2(1,1)+CLMat2(1,2))
R2=CLMat2(1,1)/(CLMat2(1,1)+CLMat2(2,1))
F12=2*P2*R2/(P2+R2)