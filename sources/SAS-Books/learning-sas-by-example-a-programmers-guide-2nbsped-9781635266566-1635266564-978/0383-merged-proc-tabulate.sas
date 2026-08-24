/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0383-proc-means.sas --- */
options fmtsearch=(learn);
***This is where the file formats.sas7bcat was
   placed;
title "Statistics on the College Data Set";
proc means data=learn.college
           n
           nmiss
           mean
           median
           min
           max
           maxdec=2;
   var ClassRank GPA;
run;
*16-3;
proc sort data=learn.college out=college;
   by SchoolSize;
run;
title "Statistics on the College Data Set - Using BY";
title2 "Broken down by School Size";
proc means data=college
           n
           mean
           median
           min
           max
           maxdec=2;
   by SchoolSize;
   var ClassRank GPA;run;
title "Statistics on the College Data Set - Using CLASS";
title2 "Broken down by School Size";
proc means data=learn.college
           n
           mean
           median
           min
           max
           maxdec=2;
   class SchoolSize;
   var ClassRank GPA;
run;

/* --- 0386-proc-tabulate.sas --- */
options fmtsearch=(learn);
title "Demographics from COLLEGE Data Set";
proc tabulate data=learn.college format=6.;
   class Gender Scholarship SchoolSize;
   tables Gender Scholarship all,
          SchoolSize / rts=15;
   keylabel n=' ';
run;
*18-3;
proc format;
   value $gender 'F' = 'Female'
                 'M' = 'Male';
run;
title "Demographics from COLLEGE Data Set";
proc tabulate data=learn.college format=6.;
   class Gender Scholarship SchoolSize;
