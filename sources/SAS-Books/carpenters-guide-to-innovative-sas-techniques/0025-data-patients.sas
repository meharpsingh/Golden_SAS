data patients(keep=sex fname lname namewidth w);
   length sex $1 fname $10 lname $15; s
   infile patlist length=len;
   input @;
   if len lt 8 then do; t
      input @2  sex $;
   end;
   else if len le 17 then do; u
      namewidth = len-7;
      input @2  sex $
            @8  fname $varying. namewidth;
   end;
   else do; v
      namewidth = len-17;
      input @2  sex $
            @8  fname $
            @18 lname $varying. namewidth; w
   end;
   run;
data datacodes;
   length dataname $15;
   input @1 width 2.
         dataname $varying. width
         datacode :2.;
   datalines;
5 Demog43
2 AE65
13lab_chemistry32
;
   run;
