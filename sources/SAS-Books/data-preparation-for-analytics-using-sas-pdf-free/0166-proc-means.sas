%MACRO
RememberDistribution(data=,vars=_NUMERIC_,lib=sasuser,stat=median);
 PROC MEANS DATA = &data NOPRINT;
  VAR &vars;
  OUTPUT OUT = &lib..train_dist_&stat &stat=;
 RUN;
