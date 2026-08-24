%macro printit(dsn=);
  * use a KEEP for CLINICS;
  %if %upcase(&dsn)=CLINICS %then
        %let keep=(keep=lname fname ssn);
  %else %let keep=;
  proc print data=&dsn &keep;
    title "Listing of %upcase(&dsn)";
    run;
%mend printit;
