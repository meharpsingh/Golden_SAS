/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/gerhard1050__Applying-Data-Science-Using-SAS/SAS Enterprise Guide Project (with programs and datasets)/ApplyingDataScience_FullSASContent_V1.egp (egp_code 143) */

﻿proc sql;
 create table target_distinct;
 as select distinct empno, firstname;
 from sales_targetratios;
 create table emp_distinct;
 as select distinct empno, firstname, department, gender;
 from employees;
 create table emp_merge;
 as select e.empno, 
           e.firstname as e_firstname,
		   t.firstname as t_firstname,
		   department,
		   gender
    from emp_distinct as e;
	left join target_distinct as t;
	on e.empno = t.empno;
quit;
