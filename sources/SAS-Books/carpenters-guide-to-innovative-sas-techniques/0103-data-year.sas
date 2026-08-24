data year;
test2000 = yrdif('07JAN2000'd,'07JAN2001'd,"ACTual");
test2001 = yrdif('07JAN2001'd,'07JAN2002'd,"ACTual");
put test2000=;
put test2001=;
run;
