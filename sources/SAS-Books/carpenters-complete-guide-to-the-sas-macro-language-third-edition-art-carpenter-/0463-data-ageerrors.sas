data ageerrors;
   set old;
   by age;
   retain firstage .;
Chapter 14: Miscellaneous Topics   417
   if _n_=1 then firstage = age;
   if age-firstage>10 then output;
   run;
