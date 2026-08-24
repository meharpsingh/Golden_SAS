%macro appnddsn(lib=DECNTRL);
%local i depath;
* Create a list of all data sets in the &LIB library;
%let depath = %sysfunc(pathname(&lib));
filename list pipe ➑
%unquote(%bquote(')dir "&depath\in*.sas7bdat" /o:n /b %bquote('));
data _null_;
  infile list truncover ➒
         end=eof;
  input memname $20.;
