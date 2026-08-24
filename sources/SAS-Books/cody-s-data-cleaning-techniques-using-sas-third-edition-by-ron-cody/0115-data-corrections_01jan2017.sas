data Corrections_01Jan2017;
   length Patno $ 3
          Account_No Dx $ 7
          Gender $ 1;
   informat Visit mmddyy10.;
   format Visit date9.;
   input Patno=
         Account_No=
         Gender=
         Visit=
         HR=
         SBP=
         DBP=
         Dx=
         AE=;
datalines;


Patno=003 SBP=110
Patno=023 SBP=146 DBP=98
Patno=027 Gender=F
Patno=039 Account_No=NJ34567
Patno=041 Account_No=CT13243
Patno=045 HR=90
;
