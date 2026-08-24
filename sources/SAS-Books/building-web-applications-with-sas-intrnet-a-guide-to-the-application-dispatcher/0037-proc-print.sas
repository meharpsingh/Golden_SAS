proc print data = &data(firstobs=&startAt obs=&obs);
 title "Simple Output - as HTML, PDF, RTF or Excel";
run;
ods _all_ close; Z
