%macro allyr2(start=10,stop=14);
   data allyear;
      set ➊
      %do year = &start %to &stop;
            yr&year(in=in&year) ➋
      %end;; ➌
      year = 2000 ➍
      %do year = &start %to &stop;
           + (in&year*&year) ➎
      %end;; ➏
      run;
%mend allyr2;
