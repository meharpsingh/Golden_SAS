  data Conditional;
length Gender $ 1
Quiz   $ 2;
input Age Gender Midterm Quiz FinalExam;
if Age lt 20 and not missing(age) then AgeGroup = 1;
else if Age ge 20 and Age lt 40 then AgeGroup = 2;
else if Age ge 40 and Age lt 60 then AgeGroup = 3;
else if Age ge 60 then AgeGroup = 4;
  datalines;
;
