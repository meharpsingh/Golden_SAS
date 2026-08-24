data patients(keep=sex fname lname);
   infile patlist truncover;
   input @2  sex $1.
         @8  fname $10.
         @18 lname $15.;
   run;
