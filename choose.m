%ѡ��ԭʼ����ѵ����TO���Լ�TESTO��PCA���ѵ����TPCA���Լ�TESTPCA
%���빤����cleanOriginal ���������datasets
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