/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0230-data-mannwhitney.sas --- */
data MannWhitney;
input b1-b8 _type_ $ _name_ $8.;
datalines;
.4922
.5946
.8389 .6011 .4688 .5286 .6042 .6000 parms
.0112
.0000
.0000 .0000 .0000 .0000 .0000 .0000 cov b1
.0000
.0092
.0000 .0000 .0000 .0000 .0000 .0000 cov b2
.0000
.0000
.0084 .0000 .0000 .0000 .0000 .0000 cov b3
.0000
.0000
.0000 .0092 .0000 .0000 .0000 .0000 cov b4
.0000
.0000
.0000 .0000 .0110 .0000 .0000 .0000 cov b5
.0000
.0000
.0000 .0000 .0000 .0133 .0000 .0000 cov b6
.0000
.0000
.0000 .0000 .0000 .0000 .0328 .0000 cov b7
.0000
.0000
.0000 .0000 .0000 .0000 .0000 .0158 cov b8
;

/* --- 0231-proc-catmod.sas --- */
proc catmod data=MannWhitney;
response read b1-b8;
