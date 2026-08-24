proc format;
   value $Gender_Check 'M','F' = 'Valid'
                       ' '     = 'Missing'
                       other   = 'Error';
run;
proc freq data=Clean.Patients;
   tables Gender / nocum nopercent missing;
   format Gender $Gender_Check.;
run;
