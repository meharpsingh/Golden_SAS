/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0124-data-sales.sas --- */
Data Sales;
  Input SaleDate Date9. Product $ Sales;
  Format SaleDate Date9.;
  Datalines;
01Aug2019 Med1 56
02Aug2019 Med2 45
02Aug2019 Med3 48
05Aug2019 Med2 56
05Aug2019 Med3 55
06Aug2019 Med1 67
07Aug2019 NA 0
08Aug2019 Med1 54
09Aug2019 Med1 45
12Aug2019 Med2 50
13Aug2019 Med1 45
13Aug2019 Med3 53
14Aug2019 Med2 67
15Aug2019 NA 0
16Aug2019 Med2 45
;

/* --- 0125-macro-dual_reporting.sas --- */
  %macro dual_reporting;
  Data Sales_Week;
    Set Sales;
    Week=Week(SaleDate);
  Run;
  %if &sysday eq Tuesday %then
    %do;
      Title 'Mid Week Detailed Sales Report';
      Proc Print Data=Sales_Week;
        By Week;
      Run;
    %end;
  %if &sysday eq Tuesday %then
    %do;
      Title 'End of Week Sales Report Summary';
      Proc Tabulate Data=Sales_Week;
        Class Product Week;
        Var Sales;
        Table Product, Week, Sales;
      Run;
    %end;
%mend dual_reporting;
