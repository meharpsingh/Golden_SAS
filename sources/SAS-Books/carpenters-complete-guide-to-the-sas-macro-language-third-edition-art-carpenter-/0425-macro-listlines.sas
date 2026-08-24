%macro ListLines(loc=, linecnt=10);
   * Build a list of files at this location;
   filename flist pipe "dir ""&loc\*.sas"" /o:n /b "; ➊
   data listlines(keep=filename sasline);
      length filename $85 rawloc  $585 sasline $100;
      infile flist truncover;
      input filename $85.; ➋
      rawloc = catt("&loc",'\',filename); ➌
      done=0;
      cnt=0;
      infile dummy filevar=rawloc end=done truncover;  ➍
      do until(done or cnt ge &linecnt);
         input sasline $char100.; ➎
         cnt+1;
         output listlines;
      end;
      run;
   filename flist clear;
   title"First &linecnt lines of each program";
   proc print data=listlines; ➏
      run;
%mend listlines; * the macro definition ends;
* Pass the number of records to list from each file;
