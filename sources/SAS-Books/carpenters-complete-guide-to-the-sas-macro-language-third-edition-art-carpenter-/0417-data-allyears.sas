data allyears(keep=&list00 &list01 &list02);
   set year2000(keep=&list00)
       year2001(keep=&list01)
       year2002(keep=&list02);
   ...code not shown...
   run;
