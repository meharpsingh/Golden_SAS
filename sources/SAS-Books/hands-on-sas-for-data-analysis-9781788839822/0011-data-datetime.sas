DATA DateTime;
INPUT Id Date_Time Datetime20.;
DATALINES;
1 01aug19:09:10:05.2
2 01aug20:19:20:10.4
;
DATA Convert_DateTime;
SET DateTime;
FORMAT Orig_Date Datetime.;
Orig_Date = Date_Time;
FORMAT Orig_Date_1 Datetime7.;
Orig_Date_1 = Date_Time;
FORMAT Orig_Date_2 Datetime12.;
Orig_Date_2 = Date_Time;
RUN;
