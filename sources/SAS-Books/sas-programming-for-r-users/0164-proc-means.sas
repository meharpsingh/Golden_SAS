ods output summary=summary_table;
proc means data=sp4r.ameshousing p10 median p90;
var saleprice gr_liv_area;
class yr_sold;
run;
proc print data=summary_table;
run;
