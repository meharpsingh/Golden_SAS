data Questionnaire;
   informat Gender 1. Q1-Q4 $1. Visit date9.;
   input Gender Q1-Q4 Visit Age;
   format Visit date9.;
datalines;
1 3 4 1 2 29May2015 16
1 5 5 4 3 01Sep2015 25
2 2 2 1 3 04Jul2014 45
2 3 3 3 4 07Feb2015 65
;
