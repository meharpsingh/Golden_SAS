proc ds2;
data;
   dcl double Tf Tc;
   /* Method modifies a value at the call site */
   method f2c(in_out double T);
   /* Fahrenheit to Celsius (Rounded) */
      T=round((T-32)*5/9);
   end;
   method init();
      do Tf=0 to 212 by 100;
         Tc=Tf;
         f2c(Tc);
         output;
      end;
   end;
enddata;
run;
quit;
