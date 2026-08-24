/* Merged listing: this program was assembled from 7 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0422-macro-applyfmt.sas --- */
%macro applyfmt(dsn=,var=,fmt=,chktype=);
   %* Make sure the format is present;
   %if &fmt = %then %do; ➎
      %put ERROR: Format is missing for a FIXRAW request;
      %put ERROR- &=DSN &=var;
      %return; ➏
   %end;
   %* Make sure that the format has a period;
   %if %index(&fmt,.)=0 %then %let fmt=&fmt..; ➐
   data &dsn; ➑
      set &dsn;
      &var = put(&var,&fmt); ➒
   run;
%mend applyfmt;

/* --- 0456-macro-smart.sas --- */
%macro smart(dsn);
  data wt;
  set &dsn;
  if "&dsn"='FEMALE' then wt = wt*2.2;
  run;
%mend smart;

/* --- 0457-macro-smart.sas --- */
%macro smart(dsn);
  data wt;
  set &dsn;
  %if &dsn=FEMALE %then wt = wt*2.2;;
  run;
%mend smart;

/* --- 0458-proc-print.sas --- */
proc print data=&dsn;
   run;

/* --- 0492-macro-genproc.sas --- */
%macro genproc(proc=,dsn=,varlst=);
   title1 "&proc Procedure for &dsn";
   proc &proc data=&dsn;
      var &varlst;
      run;
%mend genproc;

/* --- 0493-macro-mymeans.sas --- */
%macro mymeans(dsn=,    varlst=, statlst= mean max,
               outdsn=, print=noprint);
proc means data=&dsn &statlst ➊
  %if &outdsn = %then print; ➋
  %else &print; ➌
   ; ➍
var &varlst;
%if &outdsn ne %then %do; ➎
  output out=&outdsn mean= max= / autoname; ➏
%end;
run;
%mend mymeans;
* print selected stats (no output data set);
%mymeans(dsn=macro3.clinics,
         varlst=ht wt,
         statlst=mean stderr) ➐
* no printed stats (output data set only);
%mymeans(dsn=macro3.clinics,
         varlst=ht wt,
         outdsn=outstat) ➑

/* --- 0498-macro-regionrpt.sas --- */
%macro RegionRpt(dsn=macro3.clinics);
   %local i;
   * Build a macro variable for each level of REGION;
   proc sql noprint;
      select distinct region
         into :reg1 -
            from &dsn;
      %let total = &sqlobs;
      quit;
   * Break up the data set into one per region;
