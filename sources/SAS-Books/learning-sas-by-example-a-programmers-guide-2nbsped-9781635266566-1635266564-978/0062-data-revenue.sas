  data Revenue;
     retain Total 0;
     input Day : $3.
           Revenue : dollar6.;
     if not missing(Revenue) then Total = Total + Revenue;
     format Revenue Total dollar8.;
  datalines;
  Mon $1,000
  Tue $1,500
  Wed  .
  Thu $2,000
  Fri $3,000
  ;
  title "Listing of Revenue";
  proc print data=Revenue noobs;
  run;
