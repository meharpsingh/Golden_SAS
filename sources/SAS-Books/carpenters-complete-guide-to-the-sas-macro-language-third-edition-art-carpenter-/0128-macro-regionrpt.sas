%macro RegionRpt;
   * Build a macro variable for each level of REGION;
   proc sql noprint;
      select distinct region
         into :reg1 -  ➊
            from macro3.clinics;
      %let total = &sqlobs; ➋
      quit;
   * Separate analyses for each level of REGION;
   %do i=1 %to &total; ➌
      title1 "Region: &&reg&i"; ➍
      proc print data=macro3.clinics(where=(region="&&reg&i") ➍
                                       obs=10);
