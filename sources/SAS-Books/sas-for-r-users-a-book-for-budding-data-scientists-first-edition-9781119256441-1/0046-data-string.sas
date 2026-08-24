data string;
LENGTH str1 $ 12 ;
 str1='Hello World';
   length1 = lengthc(Str1);
   length_trim2 = lengthc(TRIMN(str1));
 run;
proc print data=string;
run;
