proc print data=dumpit;
run;
* Pass the number of records to dump from each file;
%dumpit (25);
