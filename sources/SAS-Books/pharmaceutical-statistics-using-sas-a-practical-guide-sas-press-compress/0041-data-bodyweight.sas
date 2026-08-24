data bodyweight;
animal_id=_n_;
input bw @@;
datalines;
22.1 25.5 24.2 26.1 23.3 22.0 21.8 24.8 23.1 23.0 23.0 24.8
25.3 25.6 24.8 24.5 26.0 23.6 26.3 24.0 26.9 25.9 22.7 22.4
22.5 22.3 22.3 25.5 20.9 24.5 22.2 23.3 20.3 26.3 27.6 26.5
26.8 25.6 26.6 23.5 22.4 21.3 23.7 26.8 24.6 24.2 26.1 26.2
;
proc sort data=bodyweight;
by bw;
data bdwt;
set bodyweight;
rand=ranuni(1202019);
block=1+int((_n_-1)/4);
proc rank data=bdwt out=bwstrat (drop=rand);
by block;
var rand;
ranks group;
proc sort data=bwstrat;
by group animal_id;
proc print data=bwstrat noobs label;
label animal_id="Animal ID"
bw="Body weight"
block="Block"
group="Treatment group";
run;
