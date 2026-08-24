PROC IMPORT OUT= R.RIHosp
 DATAFILE= "C:\Users\Monika\Dropbox\R Stats Book\
Analytics\Data\RIHospitals.xlsx"
DBMS=EXCEL REPLACE;
RANGE="RIHospitals$";
GETNAMES=YES;
MIXED=NO;
SCANTEXT=YES;
USEDATE=YES;
SCANTIME=YES;
RUN;
proc contents data=R.RIHosp;
run;
