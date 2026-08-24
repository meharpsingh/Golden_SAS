options ls=80 nocenter FORMCHAR="|----|+|---+=|-/\<>*";
proc power;
ODS output output=MortalityPowers;
TwoSampleFreq
GroupWeights =
(1 2) /* 1 UCO : 2 QCA*/
RefProportion = .12 .15 /* UCO mortality rate */
RelativeRisk =
.75 .67
/* QCA rate vs UCO rate*/
alpha = .01 .05 .10
sides = 2
Ntotal = 2100 2700
test = LRchi
/* likelihood ratio chi-square */
power = .;
plot vary (panel by RefProportion RelativeRisk);
/* Avoid powers of 1.00 in table */
data MortalityPowers;
set MortalityPowers;
if power>0.999 then power999=0.999;
else power999=power;
proc tabulate data=MortalityPowers format=4.3 order=data;
format Alpha 4.3;
class RefProportion RelativeRisk alpha NTotal;
var Power999;
table
RefProportion="Usual Care Mortality"
* RelativeRisk="QCA Relative Risk",
alpha="Alpha"
* Ntotal="Total N"
* Power999=""*mean=" "/rtspace=28;
run;
