proc format;
picture MyDate (default=15)
low-high = '%a-%d-%3B-%Y'
(datatype=date);
picture MyTime (default=14)
low-high = 'H:%0H M:%0M S:%0S'
(datatype=time);
picture MyDateTime (default=24)
low-high = '%Y.%0m.%0d @ %I:%0M:%0S %p'
(datatype=datetime);
run;
