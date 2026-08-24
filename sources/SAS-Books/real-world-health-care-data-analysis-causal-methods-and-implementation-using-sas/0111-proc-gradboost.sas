proc gradboost data=REFLt1 seed=117 earlystop(stagnation=10);
                 autotune kfold=5 searchmethod=ga;
         target ti /level=nominal;
         input Gender Race DrSpecialty /level=nominal;
         input Age DxDur BMI_B BPIInterf_B BPIPain_B CPFQ_B FIQ_B
              GAD7_B ISIX_B PHQ8_B PhysicalSymp_B SDS_B
           /level=interval;
         output out= GMBpst1;
      run;
