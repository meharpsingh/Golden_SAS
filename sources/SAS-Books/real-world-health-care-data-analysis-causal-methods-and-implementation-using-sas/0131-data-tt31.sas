DATA TT31;
  set REFLvert;
  if BPIPain = . then delete;
  if visit=2 or visit = 3 then delete;
  if OPIyn="No" THEN OPI=0;
  if OPIyn="Yes" THEN OPI=1;
run;
