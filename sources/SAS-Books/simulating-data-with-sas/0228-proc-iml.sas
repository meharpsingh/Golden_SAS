proc iml;
/* read variables from a SAS data set into vectors */
varNames = {"Name" "Age" "Height"};
use Sashelp.Class(OBS=3);
/* open data set for reading
*/
read all var varNames;
/* create three vectors: Name,...,Height */
close Sashelp.Class;
/* close the data set
*/
print Name Age Height;
