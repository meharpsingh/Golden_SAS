data Tricky;
   input x;
   if x gt 5 then Last_x = lag(x);
datalines;
;
