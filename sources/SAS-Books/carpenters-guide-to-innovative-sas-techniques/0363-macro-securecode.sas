%macro securecode;
data _null_;
  set sashelp.voption
    (where=(optname in('MPRINT','MLOGIC','SYMBOLGEN'))); n
  call symputx('hold'||left(optname),optname, 'l'); o
  run;
options nomprint nomlogic nosymbolgen; p
/* secure code goes here*/q
options &holdmprint &holdmlogic &holdsymbolgen; r
%mend securecode;
