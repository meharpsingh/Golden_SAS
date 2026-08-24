PROC LOGISTIC DATA=Remission OUTEST=betas;
   MODEL remiss(event='1')=cell smear infil li blast temp;
   OUTPUT OUT = remission_out P=p;
RUN;
QUIT;
