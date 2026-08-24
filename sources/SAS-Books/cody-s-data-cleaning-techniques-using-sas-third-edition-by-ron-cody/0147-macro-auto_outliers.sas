%macro Auto_Outliers(
   Dsn=,      /* Data set name                        */
   ID=,       /* Name of ID variable                  */
   Var_list=, /* List of variables to check           */
              /* separate names with spaces           */
   Trim=.1,   /* Integer 0 to n = number to trim      */
              /* from each tail; if between 0 and .5, */
              /* proportion to trim in each tail      */
   N_sd=2     /* Number of standard deviations        */);
   ods listing close;
   ods output TrimmedMeans=Trimmed(keep=VarName Mean Stdmean DF);
   proc univariate data=&Dsn trim=&Trim;
     var &Var_list;
   run;
   ods output close;
   data Restructure;
      set &Dsn;
      length VarName $ 32;
      array Vars[*] &Var_list;
      do i = 1 to dim(Vars);
         VarName = vname(Vars[i]);
         Value = Vars[i];
         output;
      end;
      keep &ID VarName Value;
   run;
   proc sort data=Trimmed;
      by VarName;
   run;
   proc sort data=restructure;
      by VarName;
   run;
   data Outliers;
      merge Restructure Trimmed;
      by VarName;
      Std = StdMean*sqrt(DF + 1);
      if Value lt Mean - &N_sd*Std and not missing(Value)
         then do;
            Reason = 'Low  ';
            output;
         end;
      else if Value gt Mean + &N_sd*Std
         then do;
         Reason = 'High';
         output;
      end;
   run;
   proc sort data=Outliers;
      by &ID;
   run;
   ods listing;
   title "Outliers Based on Trimmed Statistics";
   proc print data=Outliers;
      id &ID;
      var VarName Value Reason;
   run;
   proc datasets nolist library=work;
      delete Trimmed;
      delete Restructure;
   run;
   quit;
%mend Auto_Outliers;
