proc logistic data=analysis1 descending;
  class cohort (ref="non-opioid") Gender Race Dr_Rheum Dr_PrimCare /
       param=ref;
  model BPICAT_LOCF = cohort Gender Race Age BMI_B BPIInterf_B CPFQ_B
                   FIQ_B GAD7_B ISIX_B PHQ8_B PhysicalSymp_B SDS_B Dr_Rheum
                   Dr_PrimCare;
  run;
proc iml;
start RRsensitivity(beta,PC1,PC0,RRCD1,RRCD0);
    U = log((RRCD1*PC1+(1-PC1))/(RRCD0*PC0+(1-PC0)));
    betastar = beta-U;
    return(betastar) ;
finish;
beta=-0.31;
PC1=0.25;
PC0=0.15;
RRCD1=3.4;
RRCD0=3.4;
adjbeta=RRsensitivity(beta,PC1,PC0,RRCD1,RRCD0);
print adjbeta;
