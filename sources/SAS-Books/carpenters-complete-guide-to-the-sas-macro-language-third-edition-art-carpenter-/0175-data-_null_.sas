options symbolgen;
data _null_;
call symputx('pub','Fox&Hounds');
call symputx('hounds',' and &dogs');
call symputx('dogs','beagles');
run;
%put %superq(pub); ➐
%put %superq(&pub); ➑
