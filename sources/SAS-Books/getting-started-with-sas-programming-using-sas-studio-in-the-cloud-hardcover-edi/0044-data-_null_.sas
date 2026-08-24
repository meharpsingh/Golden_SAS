data _null_;
title "Checking for Out of Range Dates";
   input @1 Date mmddyy10.;
   file print;
