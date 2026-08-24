%macro tryit;
data new;
set
  %if &cond=YES %then cond; ➊
  %else general;
; ➋
run;
%mend tryit;
