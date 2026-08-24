data base;
length lname $15;
input fname $ dob :mmddyy10. lname $ &;
format dob mmddyy10.; q
datalines;
Sam 12/15/1945 Johnson   Seattle
;
