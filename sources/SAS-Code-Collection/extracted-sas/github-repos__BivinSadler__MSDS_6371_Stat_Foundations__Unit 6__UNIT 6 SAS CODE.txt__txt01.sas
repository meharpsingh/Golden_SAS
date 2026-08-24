/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/BivinSadler__MSDS_6371_Stat_Foundations/Unit 6/UNIT 6 SAS CODE.txt (txt 1) */

/*SAS Code */
data anovaCT;
input group x;
datalines;
1 3
1 5
1 7
2 10 
2 12
2 14
3 20
3 22
3 24
;
run;
