/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0012-data-class.sas --- */
libname seexls excel "&path\data\E1_2_6classmates.xls";
data class;
   set seexls.classdata; n
   run;
libname seexls clear; o
proc import out=work.classdata
            datafile= "&path\data\E1_2_6classmates.xls"
            dbms=xls replace;
   getnames=yes;
   range='classdata'; p
   run;

/* --- 0185-data-male.sas --- */
data  male
      female;
   set sashelp.class;
   if sex='M' then output male;
   else output female;
   run;
%let rc=%sysfunc(rename(work.male,Males,data));
%put &RC;

/* --- 0259-proc-print.sas --- */
ods rtf file="&path\results\E9_1b.rtf"
        style=rtf
        bodytitle;
title1 '9.1c Horizontal Lines';
title2  h=5pt bcolor=blue ' '; s
footnote h=5pt bcolor=blue ' '; t
ods html file="&path\results\E9_1c.html";
proc print data=sashelp.class(obs=4);
run;

/* --- 0367-data-_null_.sas --- */
filename maccat catalog 'advrpt.sasmacr.abc.macro';
data _null_;
  infile maccat;
  input;
  list;
  run;
%macro def/store secure;
options mprint symbolgen mlogic;
%macro dtest/secure;
proc print data=sashelp.class;
  run;
%mend dtest;
%dtest
%put %quote(%abc);
