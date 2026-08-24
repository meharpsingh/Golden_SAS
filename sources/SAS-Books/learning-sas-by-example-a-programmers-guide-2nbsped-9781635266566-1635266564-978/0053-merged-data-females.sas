/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0053-data-conditional.sas --- */
  data Conditional;
length Gender $ 1
Quiz   $ 2;
input Age Gender Midterm Quiz FinalExam;
select;
when (missing(Age)) AgeGroup = .;
when (Age lt 20) AgeGroup = 1;
when (Age lt 40) AgeGroup = 2;
when (Age lt 60) AgeGroup = 3;
when (Age ge 60) Agegroup = 4;
otherwise;
end;
  datalines;
;

/* --- 0056-data-females.sas --- */
  data Females;
set Conditional;
where Gender eq 'F';
  run;
