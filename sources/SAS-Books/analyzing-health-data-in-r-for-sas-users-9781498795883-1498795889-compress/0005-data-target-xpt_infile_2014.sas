Libname r "D:\Dropbox\Dropbox\R Stats Book\Analytics\Data";
Libname target 'D:\Dropbox\Dropbox\R Stats Book\Analytics\
Data';
libname xportin xport 'D:\Dropbox\Dropbox\R Stats Book\
Analytics\Data\LLCP2014.XPT';
/*data step reads it in and unpacks it into libname mapped
to r*/
/*the native file is called LLCP2014.xpt*/
data target.xpt_infile_2014;
set xportin. LLCP2014;
 run;
