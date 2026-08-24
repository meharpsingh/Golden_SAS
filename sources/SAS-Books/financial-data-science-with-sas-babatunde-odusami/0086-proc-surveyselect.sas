proc surveyselect data=spx_ret out=bootsamp1
       method=urs sampsize=12 reps=1000 seed=12
run;
ods exclude all;/*Suppress printing of listing
proc means data=bootsamp1 mean std;
       by replicate;
       var mret;
       ods output summary=bootstats1;
run;
ods exclude none; /*Reactivates print of listin
proc means data=bootstats1 mean stderr;
       var mret_Mean;
run;
