data _null_;
   file print;
   set Clean.Patients(keep=Patno HR);
   ***bring in the means and standard deviations;
   if _n_ = 1 then set Mean_Std_Trimmed;
   *Adjust the standard deviation;
   Mult = 1.49;
   if HR lt HR_Mean - 2*Mult*HR_StdDev and not missing(HR)
      or HR gt HR_Mean + 2*Mult*HR_StdDev then put Patno= HR=;
run;
