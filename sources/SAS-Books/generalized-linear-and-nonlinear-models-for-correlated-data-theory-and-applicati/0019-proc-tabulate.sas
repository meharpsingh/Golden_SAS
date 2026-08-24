proc tabulate data=example3 2 3 ;
class Group Visit Breast;
var NAF Estradiol;
table Group*Visit,
Breast*(NAF Estradiol)*(N*F=2.0 Mean*F=5.2 Std*F=5.2)
/rts=16;
run;
proc tabulate data=example3 2 3 ;
where Breast='Left';
class Group Visit;
var Saliva Estradiol Serum Estradiol;
table Group*Visit,
(Serum Estradiol Saliva Estradiol)*(N*F=2.0 Mean*F=6.2 Std*F=6.2)
/rts=16;
run;
