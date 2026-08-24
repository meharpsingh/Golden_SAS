/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0093-data-sportsinjury.sas --- */
Data SportsInjury;
Input Activity $ Warmup Injury Count;
Datalines;
Running 1 0 5
Running 0 1 15
Running 1 1 3
Football 1 0 16
Football 1 1 10
Football 1 1 4
Squash 1 0 2
Squash 0 1 10
Squash 1 1 0
Weights 1 0 12
Weights 0 1 6
Weights 1 1 3
Others 0 0 10
;

/* --- 0094-proc-sql.sas --- */
Proc Sql;
  Create table Analyse as
  Select Warmup, Injury, Sum(Count) as Cases
  From SportsInjury
  Group by 1,2;
Quit;
Proc Print Noobs;
Run;

/* --- 0103-proc-means.sas --- */
Proc Means Data = SportsInjury;
Class Warmup Injury;
Var Count;
Run;
