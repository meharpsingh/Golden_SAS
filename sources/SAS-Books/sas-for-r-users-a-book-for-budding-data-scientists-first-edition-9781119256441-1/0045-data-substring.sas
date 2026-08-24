data substring;
length string string1 string2 $12;
string="Hello World";
string1 = substrn(String,3,4) ; /*Extract from position 3 to 7 (3+4) */
string2 = substrn(String,4) ;/*Extract from position 4 onwards */
run;
proc print data = substring ;
run;
