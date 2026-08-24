filename patlist "&path\data\patientlist.txt";
data patients;
   infile patlist;
   input @2  sex $1.
         @8  fname $10.
         @18 lname $15.;
   run;
title '1.3.4a Varying Length Records';
proc print data=patients;
   run;
