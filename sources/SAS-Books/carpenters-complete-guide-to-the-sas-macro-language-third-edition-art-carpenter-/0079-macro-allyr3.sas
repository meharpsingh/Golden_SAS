%macro allyr3(start=,stop=);
     %let year=&start; ➊
     %do %until(&year > &stop); ➋
        data temp;
          set yr&year;
          year = 2000 + &year;
          run;
        proc datasets lib=work nolist;
          append base=allyear data=temp;
          quit;
        %let year = %eval(&year + 1); ➌
     %end;
%mend allyr3;
