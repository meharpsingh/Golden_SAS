%macro allyr4(start,stop);
     %let year=&start;
     %do %while(&year <= &stop); ➊
        data temp;
           set yr&year;
           year = 2000 + &year;
           run;
        proc datasets lib=work nolist;
           append base=allyear data=temp;
           quit;
