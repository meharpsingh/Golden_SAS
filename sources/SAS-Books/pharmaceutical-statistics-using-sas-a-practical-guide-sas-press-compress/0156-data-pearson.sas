data pearson;
input _stname_ $ 1-8 _sttype_ $ 9-12 _outcome_ $ 13-22
_reward_ 23-26 _success_ $ 27-36;
datalines;
Start
D
No go
.
.
.
Go
-1
Stage1
Stage1
C
Failure1
.
.
.
OK1
-2
Stage2
Stage2
C
Failure2
.
.
.
OK2
-3
Stage3
Stage3
C
Failure3
.
.
.
OK3
.
;
data prob;
input _event1_ $10. _prob1_ _event2_ $5. _prob2_;
datalines;
Failure1
0.2
OK1
0.8
Failure2
0.4
OK2
0.6
Failure3
0.6
OK3
0.4
;
proc dtree stagein=pearson probin=prob;
evaluate/summary;
save;
modify Go reward -3;
modify OK2 reward -1;
evaluate/summary;
run;
quit;
