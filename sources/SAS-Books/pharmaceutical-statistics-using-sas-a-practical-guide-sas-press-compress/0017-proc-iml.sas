proc iml;
* Read in the solubility data;
use solubility;
read all var ('x1':'x21') into x;
read all var {y} into y;
