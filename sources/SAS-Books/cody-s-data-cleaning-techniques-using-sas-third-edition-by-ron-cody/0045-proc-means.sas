proc means data=Clean.Patients noprint;
   var HR;
   output out=Mean_Std(drop=_type_ _freq_)
          mean=
          std= / autoname;
run;
