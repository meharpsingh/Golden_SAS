proc format;
   value Agegrp low-50='Young'
                51-high='Older'
                     . ='Missing'
                 other ='Error';
run;
data Put_Eg;
   informat Date mmddyy10.;
   input SS_Num Date Age;
   SS = put(SS_Num,ssn11.);
   Day = put(Date,downame3.);
   Age_Group = put(Age,agegrp.);
   format Date date9.;
datalines;
123456789 10/21/1950 42
890001233 11/12/2015 86
987654321 1/1/2015 15
;
title "Listing of Data Set Put_Eg";
proc print data=Put_Eg noobs;
run;
