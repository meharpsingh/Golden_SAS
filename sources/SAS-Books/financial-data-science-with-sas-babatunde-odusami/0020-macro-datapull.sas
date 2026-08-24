%macro datapull(fref,pname);
filename  &fref "%sysfunc(getoption(WORK))/&pname";
proc http
   url="https://github.com/finsasdata/Bookdata/raw/
   out=&fref
   method ="get";
run;
%mend datapull;
%datapull('File Reference','Physical Name');
