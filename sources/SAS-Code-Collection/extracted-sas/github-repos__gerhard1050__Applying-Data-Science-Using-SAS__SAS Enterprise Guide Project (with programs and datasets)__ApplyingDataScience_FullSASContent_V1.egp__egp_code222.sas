/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;
%let survpath=sashelp.class;

/* Extracted from github-repos/gerhard1050__Applying-Data-Science-Using-SAS/SAS Enterprise Guide Project (with programs and datasets)/ApplyingDataScience_FullSASContent_V1.egp (egp_code 222) */

﻿%let survpath = C:\GOTO\Box Sync\12 Know How\04 Business Analyses with SAS\08 Graphs;

%macro tif(file);
 ods printer printer=tiff style=catalog.customAnalysis file="&survpath.\&file..tif";
%mend;

%macro tc;
 ods printer close;
%mend;

/*ods printer printer=tiff style=catalog.customAnalysis file="&survpath\yourfile.tif";
*** Paste your example code here. ;
 proc print data=sashelp.class;run;
ods printer close; 
*/
/*
%tif(t4);
 proc means data=sashelp.cars;
 run;
 %tc;
*/
