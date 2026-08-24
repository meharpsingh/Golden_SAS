/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0014-data-class.sas --- */
data class;
input name $ gender $ age;
datalines;
Anna F 23
Ben M 25
Bob M 21
Brian M 27
Edward M 26
Emma F 32
;

/* --- 0015-data-work-males_over25.sas --- */
data WORK.MALES_OVER25;
set WORK.CLASS;
where Gender="M";
where age>25;
run;

/* --- 0016-data-mydata.sas --- */
DATA MYDATA;
SET sashelp.class;
SELECT(age);
 when (10) status="child";
 WHEN (11,12) status="preteen";
 OTHERWISE status="teenager";
END;
PROC PRINT DATA=MYDATA;
RUN;

/* --- 0017-data-mydata.sas --- */
DATA MYDATA;
SET sashelp.class;
SELECT;
 WHEN (age=15 and sex="F") research="include";
 OTHERWISE research="not include";
END;
PROC PRINT DATA=MYDATA;
RUN;
