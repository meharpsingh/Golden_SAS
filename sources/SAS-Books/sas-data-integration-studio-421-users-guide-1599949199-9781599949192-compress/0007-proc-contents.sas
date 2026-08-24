proc contents data = testlib."ADVERSE_SORTED"n
out2 = work.etls_constraints
noprint;
run;
/* get the number of constraints (number of rows) */
%let etl_numRows = 0;
%let etl_dsid=%sysfunc(open(work.etls_constraints));
%if (&etl_dsid gt 0) %then
%do;
%let etl_numRows = %sysfunc(attrn(&etl_dsid, NOBS));
%let etl_dsid = %sysfunc(close(&etl_dsid));
%end;
%let etl_primaryKey = NO;
%if (&etl_numRows gt 0) %then
%do; /* table has constraints */
/* determine if another table has a foreign key that points to this table */
data work.etls_constraints;
set work.etls_constraints;
type = upcase(type);
if (type eq "REFERENTIAL") then
do;
call symput("etl_primaryKey", "YES");
stop;
end;
/* delete any indexes that are created by another constraint */
if (type eq "INDEX" and ICOwn eq "YES") then
delete;
run;
%end; /* table has constraints */
%if (&etl_primaryKey eq YES) %then
%do; /* table has primary key and referential constraints */
