%macro dataval;
%local i;
* Determine list of data sets to check;
data _null_; v
  set advrpt.dsncontrol;
  cnt = left(put(_n_,5.));
  call symputx('dsn'||cnt,dsn,'l');
  call symputx('keyvars'||cnt,keyvars,'l');
  call symputx('dsncnt',cnt,'l');
  run;
