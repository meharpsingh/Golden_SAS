data Mar;
   set advrpt.demog (keep=lname fname);
   if lname =: 'Mar';
   run;
season= ceil(month(dob)/3);
