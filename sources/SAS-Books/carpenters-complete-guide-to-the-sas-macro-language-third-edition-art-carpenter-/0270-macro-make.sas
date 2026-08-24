%macro make(dsn);
%* Point indirectly to the label;
%goto &dsn;  %* DSN takes on either MALE or FEMALE;
%female:
  data wt;
  set female;
  wt = wt*2.2;
  run;
%goto next;
%male:
  data wt;
  set male;
  run;
%next:
%mend make;
