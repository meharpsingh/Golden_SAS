DATA demo ;
INPUT p q r s t u v x y z;
ARRAY b{8} p--x;           *defines an array of 8 variables in the data set;
ARRAY c{8} d e f g h i j k;                      *define 8 new variables;
DO m=1 to 8;
