%macro RegionRpt;
   * Build a macro variable for each level of REGION;
   proc sql noprint;
      select distinct region
         into :reg1 - ➊
            from macro3.clinics;
      %let total = &sqlobs; ➋
      quit;
   * Break up the data set into one per region;
