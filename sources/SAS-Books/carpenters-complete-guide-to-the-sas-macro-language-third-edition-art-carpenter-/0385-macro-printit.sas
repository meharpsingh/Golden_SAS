%macro printit;
%local i t u v ttl9 ttl10;
data _null_;
   set sashelp.vtitle(keep=type number text ➊
                      where=(type='T')) end=eof;
   if number gt 8 then call symputx(catt('ttl',number),text,'l'); ➋
   if eof then do;
      call symputx('t',left(put(number,2.)),'l'); ➌
   end;
   run;
%if &t > 8 %then %let u=9;
%else %let u = %eval(&t + 1);
%let v=%eval(&u+1);
title&u 'First custom title';
title&v 'Second custom title';
proc print data=sashelp.class(obs=3);
run;
title&u; ➍
%if &t>8 %then %do i=9 %to &t; ➎
   title&i &&ttl&i; ➏
%end;
%mend printit;
title1 'test of custom titles';
/*title9 'my title9';*/ ➐
/*title10 'my title10';*/
