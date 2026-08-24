data patients(keep=sex fname lname);
   infile patlist length=len n;
   input @; o
   namewidth = len-17; p
   input @2  sex $1.
         @8  fname $10.
         @18 lname $varying15. namewidth q;
   run;
