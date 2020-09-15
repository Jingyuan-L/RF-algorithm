%选择：原始数据训练集TO测试集TESTO、PCA后的训练集TPCA测试集TESTPCA
%输入工作区cleanOriginal 输出工作区datasets
id=randperm(567,400);

TO=X(id,:);
TESTO=X;
TESTO(id,:)=[];

TPCA=W(id,:);
TESTPCA=W;
TESTPCA(id,:)=[];

TY=Y(id,:);
TESTY=Y;
TESTY(id,:)=[];

%将TY和TESTY中1、2类别调换 否则混淆矩阵计算会相反
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