/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0109-data-base.sas --- */
Data Base;
Input CustID Year Avg_Credit Avg_Debit Spend_Indicator $;
Datalines;
1010 16 235 245 R
1010 17 230 220 A
1010 18 235 200 G
1010 19 254 220 G
1011 16 653 650 A
1011 17 650 610 G
1011 18 640 620 G
1011 19 650 656 A
1012 16 569 569 R
1012 17 560 550 G
1012 18 550 550 R
1012 19 450 400 G
;

/* --- 0110-data-base_narrow.sas --- */
Data Base_Narrow (Keep = CustID Year);
Set Base;
Where CustID=1010;
Run;

/* --- 0112-data-base_narrow.sas --- */
Data Base_Narrow (Keep = CustID Year Avg_Credit);
Set Base;
Run;
