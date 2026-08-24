proc format;
    picture MyDate (default=15)
             low-'31DEC1999'd = '%3B-%Y' (datatype=date)
            '01JAN2000'd-high = '%a-%d-%3B-%Y' (datatype=date);
run;
