       proc mixed data=dpatw empirical;
              class cohortn subjid Gender DrSpecialty;
              * adjustment for residual imbalance using covariates which have
                after re-weighting the |StdDiff|>.1;
              model chgBPIPain_LOCF=cohortn BMI_B BPIInterf_B BPIPain_B PHQ8_B
Gender DrSpecialty;
              weight ipw;
              * in order to get empirical (i.e. robust) error we have to use
                "repeated" statement although our data do not have any repeats;
              repeated subjid/subject=subjid;
              format cohortn cohort.;
              lsmeans cohortn/diff cl;
              ods output lsmeans=lsm diffs=lsmdiffs;
       run;
       * report estimated outcome;
       title1 "Adjusted chgBPIPain_LOCF with robust (""sandwich"") estimation
               of variance: IPW weights";
       proc print data=lsm noobs label;
       run;
       title1;
       * report estimated ATE;
       title1 "Adjusted ATE for chgBPIPain_LOCF with robust (""sandwich"")
               estimation of variance: IPW weights";
       proc print data=lsmdiffs noobs label;
       run;
       title1;
%mend gbmATE;
%gbmATE;
