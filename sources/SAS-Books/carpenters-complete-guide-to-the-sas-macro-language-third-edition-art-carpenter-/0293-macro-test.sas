%let city = Los Angeles;
%let state= CA;
%macro test;
%local city; ➋
%let city=Anchorage;
data _null_;
  var='state'; ➌
  if symexist("city") then do;
    if symlocal('city') then put 'macro variable city exists locally'; ➍
    if symglobl('city') then put 'macro variable city exists globally';➎
    if symglobl(var) then put 'macro variable ' var ' exists globally';➏
end;
  run;
%mend test;
