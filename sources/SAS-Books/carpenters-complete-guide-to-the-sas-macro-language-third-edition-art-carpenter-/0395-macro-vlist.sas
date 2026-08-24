%macro VList(dsn=, bylist=, id=, var=);
%global varlist;
*** create the transposed data set;
proc sort data=&dsn(keep=&bylist &id &var)
          out=srtdata
          nodupkey;
   by &bylist &id;
   run;
proc transpose data=srtdata
               out=trnsdata; ➊
   by &bylist;
   id &id;
   var &var;
   run;
* create a space-delimited variable list using a DATA step ;
data _null_ ;
set sashelp.vcolumn(where=(libname='WORK' &
                           memname='TRNSDATA' & ➋
                           name not in:('_NAME_' '_LABEL_')))
    end=eof ; ➌
   file 'c:\temp\temp.sas' lrecl=70 ; ➍
   if _n_=1 then put '%let varlist= ' @ ; ➎
   put name @ ; ➏
   if eof then put ';' ; ➐
   run ;
%include 'c:\temp\temp.sas' / source2 ; ➑
%put &=varlist;
%mend VList;
