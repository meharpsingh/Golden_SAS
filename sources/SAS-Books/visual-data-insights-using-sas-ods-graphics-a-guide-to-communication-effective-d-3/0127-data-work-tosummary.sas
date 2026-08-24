data work.ToSummary;
set sashelp.heart(keep=weight_status chol_status
bp_status);
where bp_status NE ' '
  AND chol_status NE ' '
  AND weight_status NE ' ';
if bp_status EQ 'Optimal'
then bp_measure = 1;
else
if bp_status EQ 'Normal'
then bp_measure = 2;
else bp_measure = 3; /* 'High' is the only other value
*/
run;
proc summary data=work.ToSummary nway;
class weight_status chol_status;
var bp_measure;
output out=work.Summary
       mean=avg_bp_measure; /* to be the COLORRESPONSE
