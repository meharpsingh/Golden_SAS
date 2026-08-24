%LET Period = 200507;
%LET Varlist = CustID Age Gender Region;
DATA customer_&period;
 SET source.customer_&period;
 -- some other statements --;
 KEEP &Varlist;
RUN;
