%let h=0.001;
* Delta for finite difference derivative approximation;
%let paran=7;
* Number of parameters in the model;
%let nf=2;
* Number of fixed effect parameters;
%let cost=1;
* Cost function (1, no cost function,
2, user-specified function);
* Algorithm parameters;
%let convc=1e-9;
%let maximit=1000;
%let const1=2;
%let const2=1;
%let cmerge=5;
* PK parameters;
data para;
input CL V vCL vV covCLV m s;
datalines;
0.211 5.50 0.0365 0.0949 0.0443 0.0213 8060
;
* All candidate points;
data cand;
input x @@;
datalines;
0.083 0.25 0.5 0.75 1 2 3 4 5 6 12 24 36 48 72 144
;
* Number of time points in the final design;
data ks;
input r @@;
datalines;
;
* Initial design;
data sample;
input x1 x2 x3 x4 x5 x6 x7 x8 w @@;
datalines;
0.083 0.5 1 4 12 24 72 144 1.0
;
run;
