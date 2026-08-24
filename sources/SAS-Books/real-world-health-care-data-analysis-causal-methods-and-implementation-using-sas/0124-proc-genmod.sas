PROC GENMOD DATA = REFLVert;
  where visit ge 2;
  CLASS SubjID VISIT pv_OPI DrSpecialty Gender;
  MODEL OPIyn = VISIT pv_OPI DrSpecialty BMI_B Gender age BPIPain_B
BPIInterf_B PHQ8_B PhysicalSymp_B FIQ_B GAD7_B ISIX_B
MFIpf_B CPFQ_B SDS_B
    /DIST = BIN LINK = LOGIT TYPE3 OBSTATS;
  ODS OUTPUT OBSTATS = PREDTRT0(KEEP = SUBJID VISIT opiYN PV_oPI PRED
               RENAME=(PRED=PREDTRT0));
run;
* as above predicted values are for probability of Opi = No, need to adjust predicted value to be for the
probability of the observed treatment *;
data PredTrt0;
  set PredTrt0;
  if OPIyn = 'Yes' then PredTrt0 = 1 - PredTrt0;
  keep SubjID visit OPIyn pv_Opi PredTrt0;
*** treatment selection weights:  denominator calculation probability of treatment with baseline covariates and
time-dependent covariates;
PROC GENMOD DATA = Vert;
  where visit ge 2;
  CLASS Subjid VISIT pv_OPI DrSpecialty Gender;
