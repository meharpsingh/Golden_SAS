data colds;
input sex $ residence $ periods count @@;
datalines;
female rural 0 45 female rural 1 64
female rural 2 71
female urban 0 80 female urban 1 104 female urban 2 116
male rural
0 84 male
rural 1 124 male
rural 2 82
male urban
0 106 male
urban 1 117 male
urban 2 87
;
