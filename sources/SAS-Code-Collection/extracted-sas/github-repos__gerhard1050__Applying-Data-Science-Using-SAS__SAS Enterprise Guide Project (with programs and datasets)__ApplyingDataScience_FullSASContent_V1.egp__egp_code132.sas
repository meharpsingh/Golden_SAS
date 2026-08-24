/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/gerhard1050__Applying-Data-Science-Using-SAS/SAS Enterprise Guide Project (with programs and datasets)/ApplyingDataScience_FullSASContent_V1.egp (egp_code 132) */

﻿


PROC QUANTSELECT DATA=fc_mart_smp10000;
  CLASS product_group launch_month model target_calmonth / PARAM=effect ;
  MODEL ape_stat =  
                  product_group|price_index|launch_month|product_age|
                  model|lead_time|target_calmonth|target_year_shift        @1 
                      /QUANTILE = (0.25 0.5 0.75) 
                       DETAILS=summary 
                       SELECTION=none;
RUN;
