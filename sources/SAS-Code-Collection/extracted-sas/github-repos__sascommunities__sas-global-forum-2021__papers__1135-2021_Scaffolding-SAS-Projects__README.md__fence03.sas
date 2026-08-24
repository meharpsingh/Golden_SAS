/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-global-forum-2021/papers/1135-2021_Scaffolding-SAS-Projects/README.md (fence 3) */

filename FREF1 temp;
data _null_;
file FREF1 lrecl=32767;
put '/**';
put '  @file';
put '  @brief DDL for demotable1';
put '**/';
put 'proc sql;';
put 'create table &mylib..demotable1(';
put '        tx_from num not null format=datetime19.3';
put '        ,tx_to num not null format=datetime19.3';
put '        ,vara varchar(10) not null';
put '        ,varb varchar(32) not null';
put '    ,constraint pk_demotable1';
put '        primary key(tx_from, vara));';
run;
