%macro BuildSurv;
%local k;
* 11.2.8a;
data _null_;
   . . . . code not shown . . . .
* 11.2.8b;
%do k = 1 %to &count;
   . . . . code not shown . . . .
%mend buildsurv;
