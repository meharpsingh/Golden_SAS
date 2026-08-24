data skeleton1;
   input p ptrue;
   datalines;
   0.02 0.07
   0.08 0.12
   0.12 0.17
   0.20 0.30
   0.30 0.45
   0.50 0.60
   ;
run;
%CRMsim(skeleton,target=0.3,ncohort=10,cohortsize=3,toxstop=0.9,ntrial=1000);
