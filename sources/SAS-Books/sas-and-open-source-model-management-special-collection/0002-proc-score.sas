proc score data=train score=model out=scores type=parms;
   var debtinc ninq clage clno;
run;
