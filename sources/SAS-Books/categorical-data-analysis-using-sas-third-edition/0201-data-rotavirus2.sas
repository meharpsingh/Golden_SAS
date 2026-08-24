data rotavirus2;
input region $ treatment $ counts years_risk @@ ;
log_risk=log(years_risk);
datalines;
US
Vaccine
3 7500 US
Placebo 58 7250
;
