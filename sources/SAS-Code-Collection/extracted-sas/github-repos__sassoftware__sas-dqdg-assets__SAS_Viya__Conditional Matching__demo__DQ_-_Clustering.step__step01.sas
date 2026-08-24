/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;
%let intable=sashelp.class;
%let outtable=sashelp.class;

/* Extracted from github-repos/sassoftware__sas-dqdg-assets/SAS_Viya/Conditional Matching/demo/DQ_-_Clustering.step (step 1) */

/* SAS templated code goes here */
%macro usr_dqmatch() ;

	proc dqmatch data=&intable;
		out=&outtable
		cluster=&clusterName_name
		
		&blanks1
		%if &clusonly=1 %then %do ;
			CLUSTERS_ONLY
		%end ;
		;
		
		%let con=1 ;
		%let addRule1=1; %* Rule 1 is required, so there is no checkbox for it in the UI;

		%do con=1 %to 5;
			%if &&addRule&con=1 %then %do;
				%do i=1 %to &&rule&con._count;
					criteria condition=&con var=&&rule&con._&i._name exact;
				%end;
			%end ;
		%end ;
	run;

%mend ;
