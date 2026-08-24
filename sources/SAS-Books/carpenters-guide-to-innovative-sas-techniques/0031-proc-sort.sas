proc sort data=advrpt.demog(keep= lname fname ssn)
               out=namesonly;
by lname fname;
run;
data yr6_7;
   set year2006
       year2007(keep=subject visit labdt);
   run;
data yr6_7;
   set year:(keep=subject visit labdt);
   run;
