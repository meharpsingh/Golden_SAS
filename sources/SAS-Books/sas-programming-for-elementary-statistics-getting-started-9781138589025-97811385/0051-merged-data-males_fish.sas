/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0051-data-fish.sas --- */
DATA fish;
INPUT ID Location $ Length Weight Age Gender $;
Length_in = length / 25.4;
gender = LOWCASE(gender);
State = "OK";
Location = PROPCASE(location);
DATALINES;
23   Payne   75    24   2.5   f
41   Payne   68    16   2     m
17   Payne   57    12   1.5   F
33   payne   45    14   0.5   m
18   Payne   71    20   3     F
77   Payne   60    19   2.5   f
;
PROC PRINT DATA=fish;
WHERE weight le 15;
TITLE 'Objective 4.6';
TITLE2 'Observations with Weight <= 15';
PROC MEANS DATA=fish; WHERE gender='m';
VAR length length_in weight;
TITLE2 'Summary Statistics for the Males';
RUN;
QUIT;

/* --- 0053-data-males_fish.sas --- */
DATA males_fish;
SET fish;
IF gender = "f" THEN DELETE;
RUN;
