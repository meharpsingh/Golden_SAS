/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0387-proc-sort.sas --- */
ods output Moments( ➊
                   match_all=namelist ➋
                   persist=proc➌)=work.Moments;➍
proc sort data=sashelp.class out=class;
   by age;
   run;
proc univariate data=class;
   by age; ➎
   var weight;
   run;
proc sort data=sashelp.class out=class;
   by sex;
   run;
proc univariate data=class;
   by sex; ➏
   var weight;
   run;

/* --- 0454-macro-tryit.sas --- */
%macro tryit;
data new;
  set sashelp.class(keep=name age);
  %if age > 55 %then %do; output new; %end;
  run;
%mend tryit;

/* --- 0455-data-new.sas --- */
data new;
  set sashelp.class(keep=name age);
   output new;
  run;
