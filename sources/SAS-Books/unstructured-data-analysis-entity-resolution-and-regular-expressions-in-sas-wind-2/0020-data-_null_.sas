data _NULL_;
set finalpii;
file 'F:\Unstructured Data
Analysis\Chapter_2_Example_Source\
FinallPII_Output.txt';
put surname firstname ssn dob phonenumber street
city state zip;
run;
