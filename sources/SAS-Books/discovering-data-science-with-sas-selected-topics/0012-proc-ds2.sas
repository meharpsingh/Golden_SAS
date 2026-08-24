proc ds2;
/* No output DATA set. Results returned as a report (like SQL) */
data;
   dcl double Tf Tc;
   /* Method modifies a value at the call site */
   method f2c(in_out double T);
   /* Fahrenheit to Celsius (Rounded) */
      T=round((T-32)*5/9);
   end;
   method init();
   /* Method f2c requires a variable as a parameter */
   /* Passing in a constant causes an error         */
      f2c(37.6);
   end;
enddata;
run;
quit;
