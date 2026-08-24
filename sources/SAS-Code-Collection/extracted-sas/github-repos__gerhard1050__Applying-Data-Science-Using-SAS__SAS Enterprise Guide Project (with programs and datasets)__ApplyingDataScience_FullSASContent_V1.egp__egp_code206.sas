/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/gerhard1050__Applying-Data-Science-Using-SAS/SAS Enterprise Guide Project (with programs and datasets)/ApplyingDataScience_FullSASContent_V1.egp (egp_code 206) */

﻿

/***************************************************************************
*** Überblick über die Variablen ****

SKU:               PG PP_IMP 
SKU-TIME:          LAUN_MONTH LAUN_YEAR SKU_AGE_CREATE
MODELLIERUNG:      MODEL LEADTIME
MODELLIERUNG-TIME: CREATE_CALMONTH CREATE_YEAR TIMEID_MONTH TIMEID_YEAR


rename
PG 				= Product_Group
PP_IMP 			= Price
laun_month 		= Launch_Month
SKU_Age_TimeID 	= Product_Age
ModelName 		= Model_Name
LeadTime 		= Lead_Time
TimeID_Month 	= Target_Month
TimeID_Year_Rel = Target_Year
;


***/




proc sgplot data=fcq.fc_mart_red_1pct;
 scatter x=SKU_Age_Create y=laun_year_rel;
run;
