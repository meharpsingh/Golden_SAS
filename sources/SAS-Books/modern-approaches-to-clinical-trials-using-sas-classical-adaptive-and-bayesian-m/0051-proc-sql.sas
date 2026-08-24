   proc sql noprint;
      select modspec into :modspec1 - :modspec%left(&n_mod_) from &models;
   quit;
   %if &direction=incr %then %do; %let dir=1; %end;
   %if &direction=decr %then %do; %let dir=-1; %end;
   /**********************************************************************
   Calculation of contrasts
    ***********************************************************************/
   proc iml ;
      /* read in doses, covariance mat, models/guesstimates and model names*/
      use &doses var {dose };
      read all into dose;
      use &sigma;
      read all into sigma;
      use &models;
      read all var{modelnum par1 par2 par3} into par;
      use &models;
      read all var{modnam} into modlist;
      /* Unity matrix */
      unity=j(&n_dose_, 1, 1);
      /* Empty matrix for calculated mean vectors and contrasts */
      meanmat=j(&n_dose_, &n_mod_+1, -88);
      meanmat[, 1]=dose;
      /* row labels */
      contmat=j(&n_dose_, &n_mod_, -88);
      /* calculation of stand. mean-vector for each model*/
      do j=2 to &n_mod_+1;
         modnum=par[j-1, 1];
         do i=1 to &n_dose_;   /* for each dose*/
            if modnum=1 then
               meanmat[i, j]=dose[i]/(par[j-1, 2] + dose[i]);
            if modnum=2 then
               meanmat[i, j]=exp(dose[i]/par[j-1, 2]) - 1;
            if modnum=3 then
               meanmat[i, j]=dose[i];
            if modnum=4 then
               meanmat[i, j]=log(dose[i] + par[j-1, 2]);
            if modnum=5 then
               meanmat[i, j]=dose[i] + par[j-1, 2]*dose[i]**2;
            if modnum=6 then
               meanmat[i, j]=dose[i]**par[j-1, 3]/(par[j-1, 2]**par[j-1,
                  3] + dose[i]**par[j-1, 3]);
            if modnum=7 then
               do;
                  maxDens=(par[j-1, 2]**par[j-1, 2]) * (par[j-1,
                     3]**par[j-1, 3])/((par[j-1, 2] + par[j-1,
                     3])**(par[j-1, 2] + par[j-1, 3]));
                  standdose=dose[i]/par[j-1, 4];
                  meanmat[i, j]=1/maxDens * (standdose**par[j-1, 2]) *
                     (1 - standdose)**par[j-1, 3];
               end;
         end;
      end;
      invsigma=inv(sigma);
      do j=2 to &n_mod_+1;     /* calculation of contrasts*/
         mean_t=t(meanmat[, j]);
         _1=mean_t*invsigma*unity;
         _2=t(unity)*invsigma*unity;
         _3=_1/_2;
