proc mixed;
class subject X1 X2;
model y = X1 X2 X1*X2 / ddfm=betwithin;
repeated X2 / sub=subject type=cs;
run;
