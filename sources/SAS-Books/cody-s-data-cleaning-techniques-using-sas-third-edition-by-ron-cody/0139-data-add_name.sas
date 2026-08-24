data Add_Name;
   informat FirstName LastName $12. Salary comma10.;
   input FirstName LastName Salary;
   format Salary dollar9.;
datalines;
David York 77,777
;
proc append base=Salary data=Add_Name;
run;
