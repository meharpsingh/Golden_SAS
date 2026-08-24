   %macro PDfunction(
dataset=,
target=,
PDVars=,
otherIntervalInputs=,
otherClassInputs=,
scoreCodeFile=,
      outPD=
    );
%let PDVar1 = %sysfunc(scan(&PDVars,1));
%let PDVar2 = %sysfunc(scan(&PDVars,2));
%let numPDVars = 1;
%if &PDVar2 ne %str() %then %let numPDVars = 2;
/*Obtain the unique values of the PD variable */
proc summary data = &dataset.;
class &PDVar1. &PDVar2.;
output out=uniqueXs
      %if &numPDVars = 1 %then
%do;
          (where=(_type_ = 1))
    %end;
      %if &numPDVars = 2 %then
%do;
          (where=(_type_ = 3))
    %end;
    ;
run;
