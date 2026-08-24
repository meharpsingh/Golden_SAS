   %macro ICEPlot(
        ICEVar=,
  samples=10,
  YHatVar=
        );
/*Select a small number of individuals at random*/
proc summary data = replicates;
class obsID;
output out=individuals (where=(_type_ = 1));
run;
