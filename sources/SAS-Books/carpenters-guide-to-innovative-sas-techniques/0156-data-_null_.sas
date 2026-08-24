data _null_;
   do count=1 to 3;
      put 'In loop ' count=;
   end;
   put 'Out of loop ' count=;
   run;
