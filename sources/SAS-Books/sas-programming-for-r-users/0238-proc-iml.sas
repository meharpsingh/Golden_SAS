proc iml;
n=23;
numberIterations=1000;
call randseed(23571113);
prob=j(364,1,1/365);
birthDates=j(numberIterations,n,.);
call randgen(birthDates,"Table",prob);
