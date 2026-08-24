data Year1980 Year1981 Year1982;
   set SASHELP.Retail;
   if Year = 1980 then output Year1980;
   else if Year = 1981 then output Year1981;
   else if Year = 1982 then output Year1982;
run;
