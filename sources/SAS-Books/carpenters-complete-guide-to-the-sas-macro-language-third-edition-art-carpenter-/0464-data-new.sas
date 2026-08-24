data new;
   set old;
   by age;
   if _n_=1 then call symputx('firstage',age);
   if age-&firstage>10 then output;
   run;
