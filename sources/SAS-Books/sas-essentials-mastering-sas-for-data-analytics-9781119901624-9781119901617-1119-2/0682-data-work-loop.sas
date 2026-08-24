data WORK.LOOP;
  VAL = 0;
   do ICNT = 1 to 10  by  2;
     VAL = ICNT;
   end;
run;
