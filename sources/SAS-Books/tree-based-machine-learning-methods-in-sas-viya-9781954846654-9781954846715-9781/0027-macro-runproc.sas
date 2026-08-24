%macro runProc(data=, auxVar=, outfit=);
proc gradboost data=&data. outmodel=mycas.model seed=3331333;
input x: /level=interval;
target y /level=nominal;
transferLearn &auxVar. / burn=10;
run;
