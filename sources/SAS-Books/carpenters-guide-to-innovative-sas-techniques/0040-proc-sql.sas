proc sql;
   title2 'Used in SQL data set WHERE=';
   select lname, fname, dob
      from advrpt.demog(where=(lname=:'Adams')); n
   title2 'Used in SQL WHERE Clause';
   select lname, fname, dob
      from advrpt.demog
         where lname=:'Adams'; o
proc sql;
   title2 'Using the EQT operator';
   select lname, fname, dob
      from advrpt.demog
         where lname eqt 'Adams'; p
   quit;
