%macro testPrint(data=_last_);
 %global debugFlag; n
 %if %length(&debugFlag) ne 0 %then
 %do;  /* flag set - produce debugging output */
    proc print data=&data;
     title "Debug Output: &data"; o
    run;
