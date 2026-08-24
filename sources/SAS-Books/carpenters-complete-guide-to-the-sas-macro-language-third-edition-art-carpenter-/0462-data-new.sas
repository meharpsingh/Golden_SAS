data new;
   set old;
   by age;
   retain firstage .;
   if _n_=1 then firstage = age;
   run;
