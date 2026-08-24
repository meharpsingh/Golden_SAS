proc datasets memtype=data;
   copy in=combine out=combtemp;
   quit;
%put SYSERR is  &syserr;
