data _null_;
call symputx('pub','Fox&Hounds');
call symputx('hounds','and&dogs');
call symputx('dogs','beagles');
call symputx('foxandbeagles', 'Hunt Day');
run;
%put %superq(&pub);
