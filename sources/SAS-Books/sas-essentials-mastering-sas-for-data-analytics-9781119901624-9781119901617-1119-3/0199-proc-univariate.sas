PROC UNIVARIATE;
VAR AGE
HISTOGRAM AGE/NORMAL;
INSET MEAN STD MIN MAX;
Format
values
Allows you to specify labels and formats for displayed statistics. For example,
PROC UNIVARIATE;
VAR AGE
HISTOGRAM AGE/NORMAL;
INSET MEAN="Mean" (5.2) STD ='St. Dev." (5.2);
run;
