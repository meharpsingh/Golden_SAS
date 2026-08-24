libname mycas cas;
libname local '/home/student/casuser/VBBF';
data mycas.insurance;
   set local.insurance;
run;
ods graphics on;
proc treesplit data=mycas.insurance;
class ins inv loc mm mtg moved nsf res sdb sav atm branch cc cd dda
dirdep hmown ils ira inarea;
