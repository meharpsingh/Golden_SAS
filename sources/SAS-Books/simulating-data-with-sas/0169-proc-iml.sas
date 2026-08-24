proc iml;
FixedVar = "_X1":"_X3";
RandomVar = "_Z1":"_Z12";
use All;
read all var FixedVar into X;
read all var RandomVar into Z;
close All;
