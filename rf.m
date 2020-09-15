% 随机森林 输入工作区datasets 输出工作区RFresults
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
% 查看决策树
% view(model.Trees{1},'mode','graph');
% 评估RF模型在训练集上的检测效果
err=oobError(model)
%测试
[predictYO,score]=predict(model,TESTO)
%混淆矩阵
[CLMat1, order1] = confusionmat(TESTY, str2num(char(predictYO)))
P1=CLMat1(1,1)/(CLMat1(1,1)+CLMat1(1,2))
R1=CLMat1(1,1)/(CLMat1(1,1)+CLMat1(2,1))
F11=2*P1*R1/(P1+R1)

%画图
idx1=find(str2num(char(predictYO))==1);
x1=1:size(idx1);
idx2=find(str2num(char(predictYO))==2);
x2=1:size(idx2);
plot(x1,score(idx1,1)','-*r',x2,score(idx2,1)','-*g');
legend('诊断为患病的患病风险概率','诊断为的未患病的患病风险概率');
xlabel('测试样本')
ylabel('患病风险概率（单位：%）')
axis([0,90,0,1])

