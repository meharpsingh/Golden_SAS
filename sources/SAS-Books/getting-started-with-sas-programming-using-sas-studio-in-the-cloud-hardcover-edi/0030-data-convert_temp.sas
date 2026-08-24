data Convert_Temp;
   do Temp_C = 0 to 100;
      Temp_F = 1.8*Temp_C + 32;
      output;
   end;
run;
title "Listing of Data Set Convert_Temp";
proc print data=Convert_Temp noobs;
run;
