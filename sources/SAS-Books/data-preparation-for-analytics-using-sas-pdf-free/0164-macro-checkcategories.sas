%MACRO CheckCategories(scoreds=, vars=,lib=sasuser);
*** Load the number of items in &VARS into macro variable NVARS;
%LET c=1;
%DO %WHILE(%SCAN(&vars,&c) NE);
 %LET c=%EVAL(&c+1);
%END;
%LET nvars=%EVAL(&c-1);
%DO i = 1 %TO &nvars;
PROC FREQ DATA = &scoreds NOPRINT;
 TABLE %SCAN(&vars,&i) / MISSING OUT =
&lib..score_%SCAN(&vars,&i)(DROP = COUNT PERCENT);
RUN;
