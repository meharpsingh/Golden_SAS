ods output TrimmedMeans=Trimmed;
proc univariate data=Clean.Patients trim=.1;
   var HR SBP DBP;
run;
