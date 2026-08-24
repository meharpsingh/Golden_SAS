%macro appnddsn(lib=DECNTRL);
%local i depath;
* Create a list of all data sets in the &LIB library;
%let depath = %sysfunc(pathname(&lib));  ➊
x dir "&depath\in*.sas7bdat" /o:n /b > "&depath\dirhold.txt";  ➋
data _null_;
  infile "&depath\dirhold.txt" truncover end=eof;  ➌
  input memname $20.;  ➍
  name = scan(memname,1,'.'); ➎
  call symputx(catt('dsn',_n_),name,'l'); ➏
  if eof then call symputx('dsncnt',_n_,'l'); ➐
  run;
