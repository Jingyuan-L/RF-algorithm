%朴素贝叶斯 输入工作区datasets 输出工作区NBresults


%原始数据
nb1=NaiveBayes.fit(TO,TY);
predictYO=predict(nb1,TESTO);
[CLMat1, order1] = confusionmat(TESTY, predictYO)
P1=CLMat1(1,1)/(CLMat1(1,1)+CLMat1(1,2))
R1=CLMat1(1,1)/(CLMat1(1,1)+CLMat1(2,1))
F11=2*P1*R1/(P1+R1)

%PCA数据
nb2=NaiveBayes.fit(TPCA,TY);
predictYPCA=predict(nb2,TESTPCA);
[CLMat2, order2] = confusionmat(TESTY, predictYPCA)
P2=CLMat2(1,1)/(CLMat2(1,1)+CLMat2(1,2))
R2=CLMat2(1,1)/(CLMat2(1,1)+CLMat2(2,1))
F12=2*P2*R2/(P2+R2)
