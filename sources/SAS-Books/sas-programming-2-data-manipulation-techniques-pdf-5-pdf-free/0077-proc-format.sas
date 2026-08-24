proc format;
    value stdate low - '31DEC1999'd = '1999 and before'
                '01JAN2000'd - '31DEC2009'd = '2000 to 2009'
                '01JAN2010'd - high = '2010 and later'
                . = ' Not Supplied';
run;
