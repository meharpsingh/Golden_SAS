%macro senrate(num=);
...Code not shown...
data senrate.rtsen&num;
set ratedata&num;
* Create the variable GENDER
* based on the variable SEX.
*   Table 5 Rename SEX to GENDER;
*   Table 3 & 7 use a format to define GENDER;
%if &num=5 %then %do;
   rename sex = gender;
%end;
%else %do;
   gender = put(sex, $sexdef.);
%end;
...Code not shown...
%mend senrate;
