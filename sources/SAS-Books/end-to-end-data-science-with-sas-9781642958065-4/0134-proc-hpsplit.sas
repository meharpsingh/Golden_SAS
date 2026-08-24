ODS GRAPHICS ON;
PROC HPSPLIT DATA=mydata.bank_train(DROP=row_num);
   CLASS TARGET _CHARACTER_;
   MODEL TARGET(EVENT='1') = _NUMERIC_ _CHARACTER_;
   PRUNE costcomplexity;
   PARTITION FRACTION(VALIDATE=0.3 SEED=42);
   CODE FILE='C:/Users/James Gearheart/Desktop/SAS Book Stuff/Data/bank_tree.sas';
   OUTPUT OUT = SCORED;
run;
