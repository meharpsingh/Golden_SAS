%let listnum = &sqlobs;
quit;
%* One export for each sheet;
%do i = 1 %to &listnum; q
   %let value = %scan(&valuelist,&i,%str( )); r
   proc export data=&dsn(where=(&class="&value")) s
                outfile="c:\temp\&dsn..xls"
                dbms=excel2000
                replace;
      SHEET="&class:&value";
      run;
%end;
%mend makexls;
