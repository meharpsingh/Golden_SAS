%MACRO
ScoreDistribution(data=,vars=_NUMERIC_,lib=sasuser,stat=median,alert=0.1);
 PROC MEANS DATA = &data NOPRINT;
  VAR &vars;
  OUTPUT OUT = &lib..score_dist_&stat &stat=;
 RUN;
