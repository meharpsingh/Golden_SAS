PROC EXPORT DATA= R.BRFSS_i
OUTFILE= "C:\Users\Monika\Dropbox\R Stats Book\
Analytics\Data\Analytic.csv"
DBMS=CSV REPLACE;
PUTNAMES=YES;
RUN;
