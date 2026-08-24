data tobacco;
length risk $11. ;
input f_usage $ risk $ usage $ count @@;
datalines;
no minimal
no
59 no
minimal
yes 25
no moderate
no
169 no
moderate
yes 29
no substantial
no
196 no
substantial yes
yes minimal
no
11 yes minimal
yes
yes moderate
no
33 yes moderate
yes 11
yes substantial no
22 yes substantial yes
;
proc freq;
weight count;
tables f_usage*risk*usage /cmh chisq measures trend;
tables f_usage*risk*usage /cmh scores=modridit;
run;
