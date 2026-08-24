%macro hpforest(Vars=);
proc hpforest data=mydata.bank_train  maxtrees=300
   vars_to_try=&Vars.;
       TARGET target/LEVEL=binary;
       INPUT &num_vars. / LEVEL=interval;
   ods output
   FitStatistics = fitstats_vars&Vars.(rename=(Miscoob=VarsToTry&Vars.));
run;
%mend;
