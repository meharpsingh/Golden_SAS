/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/r0f1__sashelp/beginners/README.md (fence 11) */

data alldat;
    * BMI (.=missing/1=normal/2=overweight/3=obese);
    if      bmi<=0  then bmicat=.;
    else if bmi<25  then bmicat=1; 
    else if bmi<30  then bmicat=2;
    else                 bmicat=3;
run;
