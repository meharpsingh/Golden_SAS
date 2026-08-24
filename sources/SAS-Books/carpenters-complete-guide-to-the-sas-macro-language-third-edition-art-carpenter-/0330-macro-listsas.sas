%macro listsas(f_ref=);
%local cdloc loccnt i;
%let cdloc = %sysfunc(pathname(&f_ref)); ➊
%let cdloc = %sysfunc(translate(&cdloc,%str( ),%str(%(),
                                       %str( ),%str(%)),
                                       %str( ),%str(%'))); ➋
%let cdloc = %sysfunc(tranwrd(&cdloc,%str(o   C:),%str(o__C:))); ➋
%let loccnt = %sysfunc(count(&cdloc,%str(c:),i)); ➌
data ListSAS(keep=f_macname macname);
   length fname $250 f_macname macname $32;
   %do i = 1 %to &loccnt; ➍
      done=0;
      length filein&i $250;
      fname=' ';
      do until(done);
