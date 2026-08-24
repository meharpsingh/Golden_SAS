%macro ScalePos(hvscale=2.5);
data _null_;
set sashelp.vgopt(keep=optname setting);
where optname in('HPOS','VPOS');
call symputx(optname,setting,'G'); r
run;
