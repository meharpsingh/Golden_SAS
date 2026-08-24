%let contrasts=%str(
contrast "H11" -1 0 0 0 1;
contrast "H12" -1 0 0 1 0;
contrast "H21" -1 0 1 0 0;
contrast "H22" -1 1 0 0 0;
contrast "H31" 0 -1 0 0 1;
contrast "H32" 0 0 -1 0 1;
contrast "H33" 0 -1 0 1 0;
contrast "H34" 0 0 -1 1 0;
);
%macro resam(n);
data resam;
proc transpose data=pval out=raw_p prefix=p;
var raw;
%do i=1 %to &n;
proc multtest data=dftrial noprint bootstrap n=1 seed=388&i
outsamp=resdata;
class group;
test mean(change);
&contrasts;
proc multtest data=resdata noprint out=p;
class _class_;
test mean(change);
&contrasts;
proc transpose data=p out=boot_p prefix=p;
var raw_p;
