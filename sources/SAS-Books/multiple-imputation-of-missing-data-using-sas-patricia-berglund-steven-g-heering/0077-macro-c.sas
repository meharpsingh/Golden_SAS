%macro c (v , iv );
%do i=1 %to 4;
 proc means mean min max data=c7_ex2_imp;
 var &v.&i;
 class &iv.&i;
 run;
%end;
%mend;
