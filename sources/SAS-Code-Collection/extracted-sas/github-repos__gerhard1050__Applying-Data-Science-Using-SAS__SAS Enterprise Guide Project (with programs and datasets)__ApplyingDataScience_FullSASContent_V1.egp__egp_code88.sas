/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;
%let dsn=work.snippet_out;
%let lib=work;

/* Extracted from github-repos/gerhard1050__Applying-Data-Science-Using-SAS/SAS Enterprise Guide Project (with programs and datasets)/ApplyingDataScience_FullSASContent_V1.egp (egp_code 88) */

﻿%macro data2datastep(dsn,lib,outlib,file,obs,fmt);
%local varlist fmtlist inputlist msgtype ;

%if %superq(obs)= %then %let obs=MAX;

%let msgtype=NOTE;
%if %superq(dsn)= %then %do;
   %let msgtype=ERROR;
   %put &msgtype: You must specify a data set name;
   %put;
   %goto syntax;
%end;
%let dsn=%qupcase(%superq(dsn));
%if %superq(dsn)=!HELP %then %do;
%syntax:;
   %put &msgtype: &SYSMACRONAME macro help document:;
   %put &msgtype- Purpose: Converts a data set to a SAS DATA step.;
   %put &msgtype- Syntax: %nrstr(%%)&SYSMACRONAME(dsn<,lib,outlib,file,obs>);
   %put &msgtype- dsn:    Name of the dataset to be converted. Required.;
   %put &msgtype- lib:    LIBREF of the original dataset. (Optional - if DSN is not fully qualified);
   %put &msgtype- outlib: LIBREF for the output dataset. (Optional - default is WORK);
   %put &msgtype- file:   Fully qualified filename for the DATA step code produced. (Optional);
   %put &msgtype-         Default is %nrstr(create_&outlib._&dsn._data.sas) in the SAS default directory.;
   %put &msgtype- obs:    Max observations to include the created dataset. (Optional);
   %put &msgtype-         Default is MAX (all observations);
   %put &msgtype- fmt:    Format the output dataset like the original data set? (YES|NO - Optional);
   %put &msgtype-         Default is YES ;
   %put;
   %put NOTE:   &SYSMACRONAME cannot be used in-line - it generates code.;
   %put NOTE-   Every FORMAT in the original data must have a corresponding INFORMAT of the same name.;
   %put NOTE-   Use !HELP to print these notes.;
   %return;
%end; 
%if &fmt= %then %let fmt=YES;
%let fmt=%upcase(&fmt);

%if %superq(lib)= %then %do;
    %let lib=%qscan(%superq(dsn),1,.);
    %if %superq(lib) = %superq(dsn) %then %let lib=WORK;
    %else %let dsn=%qscan(&dsn,2,.);
%end;
%if %superq(outlib)= %then %let outlib=WORK;
%let lib=%qupcase(%superq(lib));
%let dsn=%qupcase(%superq(dsn));

%if %sysfunc(exist(&lib..&dsn)) ne 1 %then %do;
   %put ERROR: (&SYSMACRONAME) - Dataset &lib..&dsn does not exist.;
   %let msgtype=NOTE;
   %GoTo syntax;
%end;

%if %superq(file)= %then %do;
   %let file=create_&outlib._&dsn._data.sas;
   %if %symexist(USERDIR) %then %let file=&userdir/&file;
%end;

%if %symexist(USERDIR) %then %do;
   %if %qscan(%superq(file),-1,/\)=%superq(file) %then;
      %let file=&userdir/&file;
%end;

proc sql noprint;
select Name;
      into :varlist separated by ' ';
   from dictionary.columns;
   where libname="&lib";
     and memname="&dsn"
;
select case type;
          when 'num' then;
             case 
                when missing(format) then cats(Name,':32.');
                else cats(Name,':',format);
             end;
          else cats(Name,':$',length,'.');
       end;
      into :inputlist separated by ' ';
   from dictionary.columns;
   where libname="&lib";
     and memname="&dsn"
;

%if %qsubstr(%superq(fmt),1,1)=Y %then %do;
select case;
       when (type= 'num' and not missing(format)) then catx(' ',Name,format);
       end;
   into :fmtlist separated by ' ';
   from dictionary.columns;
   where libname="&lib";
     and memname="&dsn"
;
%end;
quit;

data _null_;
   file "&file" dsd;
   if _n_ =1 then do;
      put "data &outlib..&dsn;";
      put @3 "infile datalines dsd truncover;";
      put @3 "input %superq(inputlist);";
      put @3 "format %superq(inputlist);";
      put "datalines4;";
   end;
   set &lib..&dsn(obs=&obs) end=last; 
   put &varlist @;
   if last then do;
      put;
      put ';;;;';
   end;
   else put;
run;
%mend;
