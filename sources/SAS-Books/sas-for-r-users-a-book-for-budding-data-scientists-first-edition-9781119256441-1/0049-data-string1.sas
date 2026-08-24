data string1;
LENGTH string1 $ 6 String2 $ 5;
/*String variables of length 6 and 5 */
String1 = 'hi';
String2 = 'user';
combined_string = String1||String2 ;
run;
proc print data=string1;
Run;
