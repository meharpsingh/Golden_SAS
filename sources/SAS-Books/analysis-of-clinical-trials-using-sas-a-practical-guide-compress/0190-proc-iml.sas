proc iml;
use &data;
read all var {n teststat} into data;
m=nrow(data);
n=data[,1];
teststat=data[,2];
prob=j(m,4,0);
prob[,1]=t(1:m);
prob[,2]=n/&nn;
