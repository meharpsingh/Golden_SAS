%macro oneBooDat(Dat=aData,booN=0);
  %local mnam; %let mnam=&sysmacroname; %verbose(&mnam &booN=booN);
  data Dat;
    set &Dat;
  run;
  %if &booN>0 %then %do;
    * stratified (by binN) bootstrap sample;
