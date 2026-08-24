%macro RBuild(dsn=,reg=);
%syslput rindat = &dsn; ➊
%syslput rinreg = &reg; ➊
rsubmit; ➋
   data buildbig;
      set &rindat(where=(region="&rinreg")); ➌
      run;
   %nrstr(%sysrput bigbuild = done;) ➍
endrsubmit;
%put NOTE: BUILDBIG status is: &bigbuild; ➎
%mend rbuild;
