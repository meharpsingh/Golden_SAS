%macro Check_ID(ID=,       /* ID variable              */
                Dsn_list=  /* List of data set names,  */
                           /* separated by spaces      */);
   %do i = 1 %to 99;
     /* break up list into data set names */
      %let Dsn = %scan(&Dsn_list,&i,' ');
      %if &Dsn ne %then %do; /* If non null data set name       */
         %let n = &i;        /* When you leave the loop, n will */
                             /* be the number of data sets      */
         proc sort data=&Dsn(keep=&ID) out=Tmp&i;
            by &ID;
         run;
      %end;
   %end;
   title  "Report of data sets with missing ID's";
   data _null_;
      file print;
      merge
      %do i = 1 %to &n;
         Tmp&i(in=In_Tmp&i)
      %end;
      end=Last;
      by &ID;
      if Last and n eq 0 then do;
         put "All ID's Match in All Files";
         stop;
      end;
      %do i = 1 %to &n;
         %let Dsn = %scan(&Dsn_list,&i);
         if not In_Tmp&i then do;
            put "ID " &ID "missing from data set &dsn";
            n + 1;
         end;
      %end;
      run;
%mend Check_ID;
