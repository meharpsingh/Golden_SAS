%macro optcont(doses=,
   models=,
   sigma=,
   direction=,
   dosevarname=);
   /**********************************************************************
   Reading in models
   ***********************************************************************/
   data &models;
      set &models;
      length modspec $ 50;
      if compress(modnam)="emax" then
         do modelnum=1;
            modspec="emax "!!compress("(ed50="!!par1!!")");
         end;
      if compress(modnam)="exponential" then
         do modelnum=2;
            modspec="exponential "!!compress("(delta="!!par1!!")");
         end;
      if compress(modnam)="linear" then
         do modelnum=3;
            modspec=modnam;
         end;
      if compress(modnam)="linlog" then
         do modelnum=4;
            modspec="linlog "!!compress("(off="!!par1!!")");
         end;
      if compress(modnam)="quadratic" then
         do modelnum=5;
            modspec="quadratic "!!compress("(delta="!!par1!!")");
         end;
      if compress(modnam)="sigEmax" then
         do modelnum=6;
            modspec="sigemax "!!compress("(ed50="!!par1!!", h="!!par2!!")");
         end;
      if compress(modnam)="betaMod" then
         do modelnum=7;
            modspec="betamod "!!compress("(del1="!!par1!!", del2="!!par2!!",
               scal="!!par3!!")");
         end;
   run;
   proc sql noprint;
      select count(distinct(dose))format=1.0 into :n_dose_ from &doses;
   quit;
   proc sql noprint;
      select count(modelnum) into :n_mod_ from &models;
   quit;
   proc sql noprint;
      select modnam into :mod1 - :mod%left(&n_mod_) from &models;
   quit;
