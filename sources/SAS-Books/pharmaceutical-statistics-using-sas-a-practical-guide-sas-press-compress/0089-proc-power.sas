proc power;
TwoSampleFreq
GroupWeights =
(1 1) (2 3) (1 2) (1 3)/* UCO:QCA */
RefProportion = .15
/* Usual Care Only (UCO) mortality rate*/
RelativeRisk =
.67
/* QCA mortality vs. UCO mortality */
alpha = .05
sides = 1 2
Ntotal = .
test =
lrchi
power = .90;
run;
