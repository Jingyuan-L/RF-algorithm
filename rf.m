% ���ɭ�� ���빤����datasets ���������RFresults
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

%       'NumPredictorsToSample' Number of variables to select at random for each
%                     decision split. Default is the square root of the
%                     number of variables for classification and one third of
%                     the number of variables for regression. Valid values
%                     are 'all' or a positive integer. Setting this argument
%                     to any valid value but 'all' invokes Breiman's 'random
%                     forest' algorithm.
%       'Method'      Either 'classification' or 'regression'. Regression
%                     requires a numeric Y.
NumTrees=50;
model=TreeBagger(NumTrees,TO,TY,'Method','classification','OOBPrediction','on');
% �鿴������
% view(model.Trees{1},'mode','graph');
% ����RFģ����ѵ�����ϵļ��Ч��
err=oobError(model)
%����
[predictYO,score]=predict(model,TESTO)
%��������
[CLMat1, order1] = confusionmat(TESTY, str2num(char(predictYO)))
P1=CLMat1(1,1)/(CLMat1(1,1)+CLMat1(1,2))
R1=CLMat1(1,1)/(CLMat1(1,1)+CLMat1(2,1))
F11=2*P1*R1/(P1+R1)

%��ͼ
idx1=find(str2num(char(predictYO))==1);
x1=1:size(idx1);
idx2=find(str2num(char(predictYO))==2);
x2=1:size(idx2);
plot(x1,score(idx1,1)','-*r',x2,score(idx2,1)','-*g');
legend('���Ϊ�����Ļ������ո���','���Ϊ��δ�����Ļ������ո���');
xlabel('��������')
ylabel('�������ո��ʣ���λ��%��')
axis([0,90,0,1])

