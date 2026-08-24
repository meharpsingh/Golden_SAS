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
PROC PRINT DATA=fish NOOBS;
VAR location state length_in weight gender;
TITLE 'Objective 4.5';
RUN;
QUIT;
