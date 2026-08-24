%macro look(dat=,cnt=);
     title "Contents of &&&dat";
     proc contents data=&&&dat;
     run;
     title2 "Showing the first &&&cnt Observations";
     proc print data=&&&dat (obs=&&&cnt);
     run;
%mend look;
