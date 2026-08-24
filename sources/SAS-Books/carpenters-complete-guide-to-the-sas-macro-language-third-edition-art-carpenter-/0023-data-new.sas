data new;
  set old;
  if batch = 2 then do;
    conc=2.5;
    concmoddate="&sysdate9"d; ➊
    concmodtime="&systime"t;
  end;
  run;
