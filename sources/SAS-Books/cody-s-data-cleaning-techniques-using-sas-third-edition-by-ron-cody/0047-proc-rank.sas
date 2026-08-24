proc rank data=Clean.Patients(keep=Patno HR) out=Tmp groups=10;
   var HR;
   ranks Rank_HR;
run;
proc means data=Tmp noprint;
   where Rank_HR not in (0,9);
   *Trimming the top and bottom 10%;
   var HR;
   output out=Mean_Std_Trimmed(drop=_type_ _freq_)
          mean=
          std= / autoname;
run;
