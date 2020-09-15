%画图
x=1:6;
yp=[78.48 93.67 91.14 81.01 77.22 93.67];
yr=[83.78 85.06 92.31 80.00 83.56 94.87];
yf1=[81.05 89.16 91.72 80.50 80.26 94.27];
plot(x,yp,'-or',x,yr,'-ob',x,yf1,'-oy');
set(gca,'xtick',[1 2 3 4 5 6])
set(gca,'xticklabel',{'NB','SVM','KNN','NN','LR','RF'})
legend('准确率P','查全率R','F1值');
xlabel('算法')
ylabel('单位：%')
axis([0,7,70,100])