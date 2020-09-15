%主成分分析
%输入工作区original 输出工作区PCA13-9
H=[heart270(:,1:13);processed(:,1:13)];
Z=zscore(H);               %数据标准化
C=cov(Z);                  %协方差
[E,D]=eig(C);             %求出协方差矩阵的特征向量、特征根
d=diag(D);                %取出特征根矩阵列向量（提取出每一主成分的贡献率）
eig1=sort(d,'descend');      %将贡献率按从大到小元素排列
E1=fliplr(E)                %依照D重新排列特征向量
S=0;
i=0;
while S/sum(eig1)<0.85
    i=i+1;
    S=S+eig1(i);
end                         %求出累积贡献率大于85%的主成分
sumg=S/sum(eig1)
W=Z*E1(:,1:i)             %输出产生的新坐标下的数据
g=eig1(1:i)/sum(eig1)
figure(1)
pareto(g);                  %画出贡献率的直方图