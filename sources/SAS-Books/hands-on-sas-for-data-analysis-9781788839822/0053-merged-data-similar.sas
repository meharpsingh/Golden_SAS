/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0053-data-logical.sas --- */
Data Logical;
Input A $ B $ C $ X Y Z;
Char = COALESCEC (A, B, C);
Num = COALESCE (X, Y, Z);
IFC = IFC (A=Char, "A", "B or C");
IFN = IFN (X=Num, "X", IFN(Y=Num, "Y", "Z"));
IFN_alt = IFN (X=Num, 9, IFN(Y=Num, 99, 999));
Datalines;
FromA FromB FromC .  2 3
;

/* --- 0054-data-similar.sas --- */
Data Similar (Drop=A B C X Y Z);
Set Logical;
IF Char = "FromA" THEN LongWayC = "A";
ELSE LongWayC = "B or C";
IF Num = . THEN LongWayN = .;
ELSE IF Num = 2 THEN LongWayN = 99;
ELSE LongWayN = 999;
Run;
