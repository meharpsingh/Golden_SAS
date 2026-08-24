data base;
length lname $15;
infile datalines dlm=',' dsd;
input fname $ lname $ birthloc $~q15. dob :mmddyy10. ;
datalines;
'Sam','Johnson', 'Fresno, CA','12/15/1945'
'Susan','Mc Callister','Seattle, WA',10/10/1983
;
run;
