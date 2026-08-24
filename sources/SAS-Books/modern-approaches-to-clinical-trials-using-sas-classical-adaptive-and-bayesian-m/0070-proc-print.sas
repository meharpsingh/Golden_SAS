   data &NewPatient.;
      length group $ 1;
      group=symget("newgroup");
      set &NewPatient.;
   run;
   proc print data=&TreatedPatients.;
   run;
   data &TreatedPatients.;
      set &TreatedPatients. &Newpatient.;
   run;
   proc print data=&TreatedPatients.;
   run;
%mend MinimizationRandomize;
* 1st subject: male, tumor I;
data NewPatient;
   input gender tumorstage;
   datalines;
1 1
;
run;
%MinimizationRandomize(TreatedPatients,NewPatient,FactorWeight,p=0.75,seed=6)
* 2nd subject: male, tumor II;
data NewPatient;
   input gender tumorstage;
   datalines;
1 2
;
run;
%MinimizationRandomize(TreatedPatients,NewPatient,FactorWeight,p=0.75,seed=6)
* 3rd subject: female, tumor II;
data NewPatient;
   input gender tumorstage;
   datalines;
2 2
;
run;
