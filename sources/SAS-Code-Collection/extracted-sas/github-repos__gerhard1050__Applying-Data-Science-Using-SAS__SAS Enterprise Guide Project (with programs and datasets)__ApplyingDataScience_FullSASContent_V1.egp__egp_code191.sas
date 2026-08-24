/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;
%let ds=work.snippet_out;

/* Extracted from github-repos/gerhard1050__Applying-Data-Science-Using-SAS/SAS Enterprise Guide Project (with programs and datasets)/ApplyingDataScience_FullSASContent_V1.egp (egp_code 191) */

﻿%macro means(data=fcq.fc_mart_red,var=ape_stat_shift,class=,stat= MIN MAX N Q1 MEDIAN Q3,LINEPLOT=YES,boxplot=YES);
title DATA=&data, var=&var, class=&class;
PROC MEANS DATA=&data;
	FW=12
	PRINTALLTYPES
	CHARTYPE
	QMETHOD=OS
	NWAY &stat	;
	VAR &var;
	CLASS &class/	ORDER=UNFORMATTED ASCENDING;
	output out=means_median_aggr median=&var q1=q1&var. q3=q3&var.;
RUN;
ODS GRAPHICS ON;
%if %upcase(&lineplot) = YES %then %do;
	proc sgplot data=means_median_aggr;
	 series x=&class y=&var;
	 *series x=&class y=q1&var.;
	 *series x=&class y=q3&var.;
	 refline 0;
	run;
%end;
%if %upcase(&boxplot) = YES %then %do;
	PROC SGPLOT DATA=&data	;
		VBOX &var / category=&class nooutliers;
	RUN;QUIT;
%end;
/* %if %upcase(&glm) = YES %then %do;
 proc glm data=&data;
  model 
%end; */;
title;
%mend;


/*** copied from https://communities.sas.com/message/149819 3.9.2014 ***/

%macro varexist;

/*----------------------------------------------------------------------


----------------------------------------------------------------------*/

(ds        /* Data set name */;

,var       /* Variable name */

);

 

/*----------------------------------------------------------------------

Usage Notes:

 

%if %varexist(&data,NAME);

  %then %put input data set contains variable NAME;

 


or the variable is not in the specified data set.;

----------------------------------------------------------------------*/

%local dsid rc ;

 

%*----------------------------------------------------------------------


-----------------------------------------------------------------------;

%let dsid = %sysfunc(open(&ds));

 

%if (&dsid) %then %do;

  %if %sysfunc(varnum(&dsid,&var)) %then 1;

  %else 0 ;

  %let rc = %sysfunc(close(&dsid));

%end;

%else 0;

 

%mend varexist;
