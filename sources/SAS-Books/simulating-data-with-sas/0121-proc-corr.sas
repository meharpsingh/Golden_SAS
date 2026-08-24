proc corr data=Sashelp.Class COV NOMISS outp=Pearson;
var Age Height Weight;
ods select Cov;
run;
/* Method 2: equivalent SAS/IML computation */
proc iml;
use Sashelp.Class;
read all var {"Age" "Height" "Weight"} into X;
close Sashelp.Class;
Cov = cov(X);
