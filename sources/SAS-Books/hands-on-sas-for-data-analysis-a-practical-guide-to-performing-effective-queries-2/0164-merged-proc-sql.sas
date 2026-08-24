/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0164-data-x.sas --- */
Data X;
Input ID VarTabA VarTabB;
Datalines;
1 66 77
2 55 66
3 77 55
;
Data Y;
Input ID Category $ VarTabC VarTabD;
Datalines;
1 A 60 70
1 B 50 60
2 A 50 60
3 C 70 50
;

/* --- 0165-proc-sql.sas --- */
Proc Sql;
  Create table One_to_One as
Select Coalesce(A.ID, B.ID) as ID, VarTabA, VarTabB, VarTabC,
VarTabD
  From X as A, Y as B
  Where A.ID=B.ID
  ;
Quit;

/* --- 0166-proc-sql.sas --- */
Proc Sql;
  Create table One_to_Many as
Select Coalesce(A.ID, B.ID) as ID, VarTabA, VarTabB, VarTabC,
VarTabD
  From X as A Inner Join Y as B
  On A.ID=B.ID
  ;
Quit;
