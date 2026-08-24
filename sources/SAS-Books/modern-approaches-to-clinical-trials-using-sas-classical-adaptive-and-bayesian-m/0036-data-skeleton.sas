data skeleton;
   input p ptrue;
   datalines;
   0.1 0.15
   0.2 0.30
   0.3 0.45
   0.4 0.55
   0.5 0.60
   0.6 0.70;
;
run;
%fCRMsim(skeleton,target=0.3,ncohort=12,tau=3,a=1,cohortsize=3,
toxstop=0.9,ntrial=1000);
%TITECRMsim(skeleton,target=0.3,ncohort=12,tau=3,a=1,cohortsize=3,
toxstop=0.9,ntrial=1000);
