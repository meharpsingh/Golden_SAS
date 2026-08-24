proc genmod data=dstcon;
     class dose / param=orthpoly;
     model resp = dose / scale=deviance;
run;
