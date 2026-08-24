%macro tryit;
data new;
%if &cond=YES %then %str(set cond;);
%else %str(set general;);
run;
%mend tryit;
