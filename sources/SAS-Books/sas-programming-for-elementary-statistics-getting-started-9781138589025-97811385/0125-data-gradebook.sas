DATA gradebook;
INPUT Student $9.    ID    Group HW1    HW2    EX1    HW3    HW4    EX2;
HWTotal = SUM(HW1, HW2, HW3, HW4);
EXTotal = SUM(EX1, EX2);
CourseTL = SUM(HWTotal, EXTotal);
LABEL HWTotal = "Homework Point Total"
      EXTotal = "Exam Score Total"
            CourseTL= "Point Total for the Course";
DATALINES;
Total           .     .     75    110    100    50    25    100
Dave       101  1     71    88    93     46     23    88
Lynn       381  2     64    96    95     48     25    .
Michael    987  2     68    75    97     35     12    60


SAS for Elementary Statistics
Leslie          579   3     55    75    81     .     17    82
Andrew          239   1     70    79    77     38    23    77
Elizabeth       128   3     67    103   94     42    20    92
;
PROC PRINT DATA=gradebook LABEL NOOBS;
TITLE 'Objective 10.1';
TITLE2 'PRINT Procedure with LABEL Option';
RUN;
QUIT;
