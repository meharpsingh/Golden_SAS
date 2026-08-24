data a;
input x $40.;
cards;
"My&Name &IS &akansha"
"Hello & World"
;
Run;
data a2;
set a;
x1=compress(x,' ');
run;
proc print data=a2;
run;
