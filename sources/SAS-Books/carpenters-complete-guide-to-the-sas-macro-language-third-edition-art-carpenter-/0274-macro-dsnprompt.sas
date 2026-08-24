%macro dsnprompt(lib=sasuser);
%* prompt user to for data set name;
%window verdsn color=white   ➊
  #2 @5 "Specify the data set of interest" ➋
  #3 @5 "for the library &lib"  ➌
  #4 @5 'Enter Name: '
         dsn 20 ➍ attr=underline required=yes ➎;
%display verdsn; ➏
title1 "8.2.3a Print the &lib..&dsn data set";
proc print data=&lib..&dsn;
run;
%mend dsnprompt;
