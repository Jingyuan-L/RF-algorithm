%������ϴ ���빤����original ���������cleanOriginal��X Y W��
%ԭʼ��������X���Y 
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

