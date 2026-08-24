%macro age(begdate,enddate);
 (floor((intck('month',&begdate,&enddate)-(day(&enddate)<day(&begdate)))/12))
%mend age;
proc print data=advrpt.demog;
  * select subjects over 45 as of Feb 18, 1998;
  where %age(dob,'18feb1998'd) gt 45;
  var fname lname dob;
  run;
%let dog=scott;
%let dog1=bill;
%let dog2=george;
%let dog3=notsue; q
%macro nextdog;
%local cnt;
%let cnt=;
%do %while(%symexist(dog&cnt)); r
  %let cnt=%eval(&cnt+1); s
%end;
&cnt t
%mend nextdog;
%put nextdog is %nextdog;
%let dog%nextdog=Johnny; u
%put nextdog is %nextdog;
