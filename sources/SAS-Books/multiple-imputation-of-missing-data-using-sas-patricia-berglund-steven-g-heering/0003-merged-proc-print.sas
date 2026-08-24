/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0003-data-sample.sas --- */
data sample;
 input id heartbeat age;
 datalines;
  1    32    66
  2    99    68
  3    47    62
  4    43    93
  5    24    100
  6    86    58
  7    40     .
  8    67    38
  9    26     .
 10    45    20
 11    47    58
 12    83    93
 13    41     .
 14    55    57
 15    51    97
 16    77    80
 17    80    82
 18    63    38
 19    59    26
 20    57    57
 ;
run;

/* --- 0004-proc-print.sas --- */
proc print data=sample noobs;
run;

/* --- 0005-proc-mi.sas --- */
proc mi data=sample nimpute=0;
run;
