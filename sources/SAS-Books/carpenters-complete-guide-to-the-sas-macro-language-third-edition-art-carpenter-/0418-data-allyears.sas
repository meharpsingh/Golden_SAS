%let alllist = %distinctlist(&list00 &list01 &list02);
data allyears(keep=&alllist);
   set year2000(keep=&list00)
       year2001(keep=&list01)
       year2002(keep=&list02);
   ...code not shown...
   run;
