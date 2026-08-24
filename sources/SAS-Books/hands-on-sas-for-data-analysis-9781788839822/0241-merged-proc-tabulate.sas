/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0241-data-sales.sas --- */
Data Sales;
  Input Country $7. Segment $11. Type $ Product $ Amt;
  Datalines;
;

/* --- 0242-proc-tabulate.sas --- */
Proc Tabulate Data=Sales;
  Class Country Segment Type Product;
  Var Amt;
  Table Country*Segment*Product,Amt*Type*Mean;
Run;
