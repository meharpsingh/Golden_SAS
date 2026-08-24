  data Females;
length Gender $ 1
Quiz   $ 2;
input Age Gender Midterm Quiz FinalExam;
if Gender eq 'F';
  datalines;
  21 M 80 B- 82
  .  F 90 A  93
  35 M 87 B+ 85
  48 F  . .  76
  59 F 95 A+ 97
  15 M 88 .  93
  67 F 97 A  91
  .  M 62 F  67
  35 F 77 C- 77
  49 M 59 C  81
  ;
  title "Listing of Females";
  proc print data=Females noobs;
  run;
