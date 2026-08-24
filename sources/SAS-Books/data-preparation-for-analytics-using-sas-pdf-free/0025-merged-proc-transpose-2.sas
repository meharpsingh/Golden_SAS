/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0025-data-class.sas --- */
DATA class;
 SET sashelp.class;
 ID = _N_;
RUN;

/* --- 0026-proc-transpose.sas --- */
PROC TRANSPOSE DATA = class OUT = class_tp;
 BY ID name;
 VAR sex age height weight;
RUN;

/* --- 0027-data-key_value.sas --- */
DATA Key_Value;
 SET class_tp;
 RENAME _name_ = Key;
 Value = strip(col1);
 DROP col1;
RUN;

/* --- 0028-proc-transpose.sas --- */
PROC TRANSPOSE DATA = key_value OUT = one_row;
 BY id name;
 VAR value;
 ID key ;
RUN;
DATA one_row;
 SET one_row(RENAME = (Age=Age2 Weight=Weight2 Height=Height2));
 FORMAT Age 8. Weight Height 8.1;
 Age = INPUT(Age2,$8.);
 Weight = INPUT(Weight2,$8.);
