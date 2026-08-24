%macro mkfmt(lib=, dsn=, fmtname=, from=, too=);
   %* When the fmt name is unspecified,
   %* use the incoming var name (FROM) as the format name;
   %if &fmtname= %then %let fmtname=&from;  ➊
   * Eliminate duplicate values of &from;
   proc sort data=&dsn(keep=&from &too)
             out=temp
             nodupkey;
      by &from;
      run;
   data control(keep=fmtname start label type); ➋
      set temp(rename=(&from=start &too=label));
      length type $1 fmtname $18;
      retain fmtname "&fmtname" type ' ';
      * Determine the format type;
      If _n_=1 then type = vtype(start); ➌
      run;
   proc format
         %if &lib ne %then library=&lib; ➍
         cntlin=control;
      run;
   %if &lib ne %then %fmtsrch(lib=&lib,add=x); ➎
%mend mkfmt;
