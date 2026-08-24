proc sql;
delete * from testlib."ADVERSE_SORTED"n;
quit;
%RCSET(&sqlrc);
%end; /* table has primary key and referential constraints */
%else
%do; /* table does not have a primary key and referential constraints */
%if (&etl_numRows gt 0) %then
%do; /* table has constraints */
/* delete the constraints from the table */
proc datasets lib=testlib nolist;
modify "ADVERSE_SORTED"n;
ic delete _all_;
quit;
%end; /* table has constraints */
/* physically delete all the records from the table */
data testlib."ADVERSE_SORTED"n;
set testlib."ADVERSE_SORTED"n;
stop;
run;
%RCSET(&syserr);
%if (&etl_numRows gt 0) %then
%do; /* table has constraints */
/* recreate the constraints on the table */
data _null_;
set work.etls_constraints end=eof;
if _n_ eq 1 then
do;
call execute("proc datasets lib=testlib nolist;");
call execute(& modify "ADVERSE_SORTED"n;');
end;
call execute(" " || recreate);
if eof then
call execute("quit;");
run;
%RCSET(&syserr);
%end; /* table has constraints */
