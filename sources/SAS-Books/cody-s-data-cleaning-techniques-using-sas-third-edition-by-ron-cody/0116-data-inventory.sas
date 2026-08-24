data Inventory;
   length PartNo $ 3;
   input PartNo $ Quantity Price;
datalines;
133 200 10.99
198 105 30.00
933 45 59.95
;
data Transaction;
   length PartNo $ 3;
   input Partno=
         Quantity=
         Price=;
datalines;
PartNo=133 Quantity=195
PartNo=933 Quantity=40 Price=69.95
;
proc sort data=Inventory;
   by Partno;
run;
proc sort data=Transaction;
   by PartNo;
run;
data Inventory_22Feb2017;
   update Inventory Transaction;
   by Partno;
run;
