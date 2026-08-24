%macro errrpt(dsn=, bylst=subject); n
%local i chkcnt;
proc sql noprint;
   select errtst, errvar, errval, errtxt, errrating
      into :errtst1-:errtst99, o
           :errvar1-:errvar99,
           :errval1-:errval99,
           :errtxt1-:errtxt99,
           :errrating1-:errrating99
         from vallab; p
   %let chkcnt = &sqlobs; q
   quit;
data errrpt(keep=dsn errvar errval errtxt errrating
                 &bylst); r
   length dsn        $25
          errvar     $15
          errval     $25
          errtxt     $15
          errrating  8;
set &dsn s ;
%do i = 1 %to &chkcnt; t
   %* Write as many error checks as are needed;
   if &&errvar&i &&errtst&i u then do;
      dsn = "&dsn";
      errvar = "&&errvar&i"; v
      errval = &&errval&i;
      errtxt = "&&errtxt&i";
      errrating= &&errrating&i;
      output errrpt;
      end;
   %end;
   run;
%mend errrpt;
