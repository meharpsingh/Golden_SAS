  data Conditional;
length Gender $ 1
Quiz   $ 2;
input Age Gender Midterm Quiz FinalExam;
if missing(Age) then AgeGroup = .;
else if Age lt 20 then AgeGroup = 1;
else if Age lt 40 then AgeGroup = 2;
else if Age lt 60 then AgeGroup = 3;
else if Age ge 60 then AgeGroup = 4;
  datalines;


;
