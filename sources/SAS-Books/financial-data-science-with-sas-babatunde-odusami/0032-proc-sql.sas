proc sql;
       create table Portfolio_Metrics as select * f
               on totalhold.date=portb.date;
