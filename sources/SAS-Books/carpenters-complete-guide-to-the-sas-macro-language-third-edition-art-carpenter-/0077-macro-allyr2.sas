%macro allyr2(start=10,stop=14);
   data allyear;
      set
      %do year = &start %to &stop;
            yr&year(in=in&year)
      %end;;
      year = 2000
      %do year = &start %to &stop;
           + (in&year*&year)
      %end;;
      run;
%mend allyr2;
%allyr2(start=11, stop=13)
The call to %allyr2(start=11, stop=13) generates only one DATA step:
data allyear;
set yr11(in=in11)
    yr12(in=in12)
    yr13(in=in13);
year = 2000 +
       (in11*11) +
       (in12*12) +
       (in13*13);
run;
