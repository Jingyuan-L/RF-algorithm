%数据清洗 输入工作区original 输出工作区cleanOriginal（X Y W）
%原始样本数据X类别Y 
X=[heart270(:,1:13);processed(:,1:13)];
processedY=processed(:,14);
i=0;
while i<297
    i=i+1;
    if processedY(i)==0
        processedY(i)=1;
    else
        processedY(i)=2;
    end
end
Y=[heart270(:,14);processedY(:,1)];

