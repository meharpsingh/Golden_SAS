data stage2;
length _outcome_ $15.;
input _stname_ $ _sttype_ $ _outcome_ $ _success_ $;
datalines;
Decision D No_go
.
.
. Go
Develop
Develop
C Eff_super
AE
.
. Eff_noninf AE
.
. Eff_infer
.
AE
C AE_super
.
.
. AE_equal
.
;
* Trial's outcome;
symbol1 value=triangle height=10 color=black width=3 line=1;
* Decision point;
symbol2 value=square height=10 color=black width=3 line=1;
* End nodes;
symbol3 value=none height=10 color=black width=3 line=1;
proc dtree stagein=stage2;
treeplot/graphics norc nolegend
linka=1 linkb=2 symbold=2 symbolc=1 symbole=3;
run;
quit;
