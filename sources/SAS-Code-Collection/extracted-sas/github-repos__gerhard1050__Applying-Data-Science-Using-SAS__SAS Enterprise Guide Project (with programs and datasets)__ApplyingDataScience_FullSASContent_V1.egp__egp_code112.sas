/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;
%let ds=work.snippet_out;

/* Extracted from github-repos/gerhard1050__Applying-Data-Science-Using-SAS/SAS Enterprise Guide Project (with programs and datasets)/ApplyingDataScience_FullSASContent_V1.egp (egp_code 112) */

﻿
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


%macro CALC_REFERENCE_CATEGORY (ParmEst     = ParameterEstimates,
                                ClassLevels = ClassLevelInfo,
                                OutputDS    = _ParmEst_XT_);

data _ParmEst_;
 set &ParmEst;
 %if %varexist(&ParmEst, step) %then %do; if step ne . then delete; %end;
 keep Effect Parameter Estimate StandardizedEst StdErr tValue Probt PosVar;
 lag_effect = lag(effect);
 if effect ne lag_effect then PosVar + 1;
run;

data _ParmEstClass_;
     _ParmEstInt_;
 set _ParmEst_;
 Parameter =  strip(Parameter);
 Variable  =  scan(parameter,1);
 ClassLevel = scan(parameter,2);
 if ClassLevel = "" then output _ParmEstInt_;
 else output _ParmEstClass_;
run;

data _ClassLevelsList_(rename=(class=Variable));
 set &ClassLevels;
 drop i levels values;
 do i = 1 to levels;
 	ClassLevel = scan(values,i);
	ClassID + 1;
  	output;
 end;
run;

proc sql;
 delete from _ClassLevelsList_;
 where variable not in (select distinct variable from _ParmEstClass_);
quit;

proc sql;
 create table _ParmEstClass_XT_;
 as select a.*, b.*;
    from _ClassLevelsList_ as a;
	full join _ParmEstClass_ as b;
	on a.variable = b.variable
	 and a.ClassLevel = b.ClassLevel
    order by variable, classid;
quit;


data _ParmEstClass_XT_(drop=cum_coeff lag_PosVar ClassID);
 set _ParmEstClass_XT_;
 by variable;
 lag_PosVar = lag(PosVar);
 if first.variable then cum_coeff = estimate;
 else  cum_coeff + estimate;
 if estimate = . then do; 
               estimate = -cum_coeff;
			   PosVar = lag_PosVar;
			end;
run;


data &OutputDS;
 set _ParmEstClass_XT_ _ParmEstInt_;
 if effect = "" then do; 
              effect = variable;
			  parameter = catx(' ',variable,classlevel);     end;
 drop variable classlevel;
run;

proc sort data=&OutputDS; by PosVar;run;
proc print; 
 var effect parameter estimate stderr probt;
run;
proc delete data=_ParmEstClass_XT_ _ParmEstClass_ _ParmEstInt_ _ClassLevelsList_ _ParmEst_; run;

%mend;
