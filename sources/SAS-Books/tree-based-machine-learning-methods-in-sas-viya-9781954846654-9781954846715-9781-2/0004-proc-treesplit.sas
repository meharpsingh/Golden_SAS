PROC TREESPLIT < options >;
CLASS variables;
GROW criterion < options > ;
MODEL response = variable. . .;
OUTPUT OUT=CAS-libref.data-table output-options;
PARTITION < partition-options>;
PRUNE prune-method < (prune-options) >;
WEIGHT variable;
