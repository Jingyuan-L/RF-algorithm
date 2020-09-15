%对数几率回归 输入工作区datasets 输出工作区LGSTresults
%将TY和TESTY中1、2类别调换 否则混淆矩阵计算会相反 原1没有2有 → 改为0有 1没有
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

%原始数据
lgst1 = glmfit(TO,TY,'binomial', 'link', 'logit'); %用逻辑回归来计算系数矩阵
logitFit = glmval(lgst1,TESTO, 'logit'); %用逻辑回归的结果预测测试集的结果
%反归一化
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
%混淆矩阵
[CLMat1, order1] = confusionmat(TESTY, predictYO)
P1=CLMat1(1,1)/(CLMat1(1,1)+CLMat1(1,2))
R1=CLMat1(1,1)/(CLMat1(1,1)+CLMat1(2,1))
F11=2*P1*R1/(P1+R1)

%PCA数据
lgst2 = glmfit(TPCA,TY,'binomial', 'link', 'logit'); %用逻辑回归来计算系数矩阵
logitFit2 = glmval(lgst2,TESTPCA, 'logit'); %用逻辑回归的结果预测测试集的结果
%反归一化
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
%混淆矩阵
[CLMat2, order2] = confusionmat(TESTY, predictYPCA)
P2=CLMat2(1,1)/(CLMat2(1,1)+CLMat2(1,2))
R2=CLMat2(1,1)/(CLMat2(1,1)+CLMat2(2,1))
F12=2*P2*R2/(P2+R2)