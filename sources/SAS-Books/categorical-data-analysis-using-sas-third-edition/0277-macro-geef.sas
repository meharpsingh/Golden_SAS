%macro geef;
data temp1;
set clustout;
drop Label1 cvalue1;
if Label1='Number of Clusters';
