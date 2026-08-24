%macro doboth(indata=,vlist=,cnt=10);
     %sortit(dset=&indata, bylist=&vlist) ➊
     %look(dsn=&indata,obs=&cnt) ➋
%mend doboth;
%macro look(dsn=clinics,obs=);
     title1 "data set &dsn";
     proc contents data=&dsn;
         run;
     title2 "first &obs observations";
     proc print data=&dsn (obs=&obs);
         run;
%mend look;
%macro sortit(dset=biomass,bylist=);
     proc sort data=&dset; ➌
         by &bylist; ➍
         run; ➎
%mend sortit;
