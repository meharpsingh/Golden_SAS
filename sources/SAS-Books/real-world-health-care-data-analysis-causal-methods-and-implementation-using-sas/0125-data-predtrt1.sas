data PredTrt1;
  set PredTrt1;
  if OPIyn = 'Yes' then PredTrt1 = 1 - PredTrt1;
  keep SubjID visit OPIyn pv_Opi PredTrt1;
*** censoring adjustment weights:  numerator calculation (probability of not being censored using only
baseline covariates);
PROC GENMOD DATA = Vert;
  where 2 le visit le 4;
    CLASS Subjid VISIT gender DrSpecialty Gender ;
    MODEL Censor = VISIT DrSpecialty BMI_B Gender age BPIPain_B BPIInterf_B
   PHQ8_B PhysicalSymp_B FIQ_B GAD7_B ISIX_B MFIpf_B CPFQ_B
   SDS_B
      /DIST = BIN LINK = LOGIT TYPE3 OBSTATS;
    ODS OUTPUT OBSTATS = PREDREM0(KEEP = SUBJID VISIT CENSOR PRED
   RENAME=(PRED=PREDNCEN0));
RUN;
* as above predicted values are for the probability of not being censored, no adjustment to the predicted values
are needed*;
data PredRem0;
  set PredRem0;
  keep SubjID visit censor PredNCen0;
*** censoring adjustment weights:  denominator calculation probability of not being censored using baseline
covariates and time-dependent covariates;
PROC GENMOD DATA = REFLVert;
  where 2 le visit le 4;
  CLASS Subjid VISIT pv_OPI DrSpecialty Gender;
