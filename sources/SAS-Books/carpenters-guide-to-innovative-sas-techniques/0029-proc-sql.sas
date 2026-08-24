proc sql noprint;
   connect to odbc (dsn=clindat uid=Susie pwd=pigtails); n
   create table stuff as select * from connection to odbc (
      select * from q.org o
         for fetch only
      );
   disconnect from odbc; p
   quit;
data _null_;
   set advrpt.demog(keep=fname lname dob);
   file csv_b dsd;o
   if _n_=1 then put 'FName,LName,DOB';
   put (_all_)(?) p;
   run;
