%macro allyr(start=04,stop=05);
   %do year = &start %to &stop; ➊
      data temp;
         set yr&year;
         year = 2000 + &year; ➋
         run;
